import 'package:flutter/material.dart';
import 'BovinoForm.dart';
import '../helper/bovino_helper.dart';
import '../utils/Dialogs.dart';
import 'package:flutter_integrador/ui/Menu.dart';
import '../helper/Api.dart';

class BovinoPage extends StatefulWidget {
  final String token;
  final int usuario_id;

  BovinoPage(this.token, this.usuario_id);

  @override
  _BovinoPageState createState() => _BovinoPageState();
}

enum OrderOptions { cadastrar }

class _BovinoPageState extends State<BovinoPage> {
  Dialogs dialog = new Dialogs();
  // LoginHelper helperLog = LoginHelper();
  BovinoHelper helper = BovinoHelper();
  List<Bovino> bovino = List();
  Api api = new Api();

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    _getAllBovinos();
  }

  _getAllBovinos() async {
    api.bovinos(widget.token).then((list) {
      setState(() {
        isLoading = false;
        bovino = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Text('Rebanho Leiteiro'),
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
          actions: <Widget>[
//            RaisedButton(
//              child: new Row(
//                children: <Widget>[
//                  new Icon(Icons.add),
//                  new Text("Cadastrar"),
//                ],
//              ),
//              color: Colors.deepOrange,
//              textColor: Colors.white,
//              //splashColor: Colors.grey,
//              //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//              onPressed: ({Bovino bovino}) {
//                _showBovinoPage();
//              },
//            ),
            PopupMenuButton<OrderOptions>(
              child: Icon(Icons.add),
                //elevation:5,
                itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
                  const PopupMenuItem<OrderOptions>(
                    child: Text('Registrar Bovino'),
                    value: OrderOptions.cadastrar,
                  ),
                ],
                onSelected: _orderList),
          ],
        ),
        backgroundColor: Colors.lightGreen,
        body: WillPopScope(
            child: (isLoading)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemCount: bovino.length,
                    itemBuilder: (context, index) {
                      return _bovinoCard(context, index);
                    }),
            onWillPop: () {
              return null;
            }));
  }

  void _showBovinoPage({Bovino bovino}) async {
    final recBovino = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BovinoForm(
                  bovino: bovino,
                  token: widget.token,
                )));
    if (recBovino != null) {
      if (bovino != null) {
        await api.atualizarBovino(recBovino, widget.usuario_id, widget.token);
        // print(widget.usuario_id);
        print(recBovino);
      } else {
        await api.cadastroBovino(recBovino, widget.usuario_id, widget.token);
        //print(widget.usuario_id);
        print(recBovino);
      }
      _getAllBovinos();
    }
  }

  Widget _bovinoCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child:
                Column(
                  children: <Widget>[
                    ListTile(

                      title: Text('Nome: ' + bovino[index].id),
                      subtitle: Text('Nº Brinco: ' + bovino[index].brinco),
                      trailing: Text('Raça:\n' + bovino[index].nomeRaca),
                    ),
                    ListTile(
                      title: Text('Data de Nascimento:\n' + bovino[index].nascimento),
                      trailing: Text('Peso estimado:\n' +bovino[index].peso.replaceAll('.', ',')+' Kg'),
                    )
                  ],
                )
        ),
      ),
      onTap: () {
        _showOptions(context, index);
      },
    );
  }

  void _showOptions(BuildContext context, int index) {
    List<Widget> botoes = [];
    botoes.add(FlatButton(
      child: Row(
        children: <Widget>[
          Icon(Icons.edit, color: Colors.deepOrange),
          Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                children: <Widget>[
                  Text(
                    'Atualizar Informações',
                    style: TextStyle(color: Colors.deepOrange, fontSize: 15.0),
                  )
                ],
              ))
        ],
      ),
      onPressed: () {
        Navigator.pop(context);
        _showBovinoPage(bovino: bovino[index]);
      },
    ));
    botoes.add(FlatButton(
      child: Row(
        children: <Widget>[
          Icon(Icons.delete, color: Colors.deepOrange),
          Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                children: <Widget>[
                  Text(
                    'Apagar Registro',
                    style: TextStyle(color: Colors.deepOrange, fontSize: 15.0),
                  )
                ],
              ))
        ],
      ),
      onPressed: () {
        api.deletarBovino(bovino[index].id, widget.token);
        setState(() {
          bovino.removeAt(index);
          Navigator.pop(context);
        });
      },
    ));
    dialog.showBottomOptions(context, botoes);
  }

  void _orderList(OrderOptions result, {Bovino bovino}) async {
    switch (result) {
      case OrderOptions.cadastrar:
        _showBovinoPage();
        break;
//      case OrderOptions.orderza:
//        ordenha.sort((a, b) {
//          return b.coleta.toLowerCase().compareTo(a.coleta.toLowerCase());
//        });
//        break;
    }
    setState(() {});
  }

}
