import 'package:flutter/material.dart';
import 'package:flutter_integrador/ui/PartoForm.dart';
import '../helper/parto_helper.dart';
import '../utils/Dialogs.dart';
import 'package:flutter_integrador/ui/Menu.dart';
import '../helper/Api.dart';
import 'package:flutter_integrador/utils/Strings.dart';
import 'package:intl/intl.dart';

class PartoPage extends StatefulWidget {
  final String token;

  PartoPage(this.token);

  @override
  _PartoPageState createState() => _PartoPageState();
}

enum OrderOptions { cadastrar }

class _PartoPageState extends State<PartoPage> {
  final formatoData = new DateFormat("dd-MM-yyyy");
  Dialogs dialog = new Dialogs();
  // LoginHelper helperLog = LoginHelper();
  PartoHelper helper = PartoHelper();
  List<Parto> parto = List();
  Api api = new Api();

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    _getAllPartos();
  }

  _getAllPartos() async {
    api.partos(widget.token).then((list) {
      setState(() {
        isLoading = false;
        parto = list;
      });
    });
  }

  nascido(index) {
    String resposta;
    if (parto[index].nascido == '1') {
      resposta = vivo;
    } else if (parto[index].nascido == '2') {
      resposta = morto;
    }
    return resposta;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Text('Partos Registrados'),
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
          actions: <Widget>[
            PopupMenuButton<OrderOptions>(
                itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
                      const PopupMenuItem<OrderOptions>(
                        child: Text('Registrar Parto'),
                        value: OrderOptions.cadastrar,
                      ),
//                      const PopupMenuItem<OrderOptions>(
//                        child: Text('Ordenar de Z-A'),
//                        value: OrderOptions.orderza,
//                      ),
                    ],
                onSelected: _orderList)
          ],
        ),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showPartoPage();
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: WillPopScope(
            child: (isLoading)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemCount: parto.length,
                    itemBuilder: (context, index) {
                      return _partoCard(context, index);
                    }),
            onWillPop: () {
              return null;
            }));
  }

  void _showPartoPage({Parto parto}) async {
    final recParto = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PartoForm(
                  parto: parto,
                  token: widget.token,
                )));
    if (recParto != null) {
      if (parto != null) {
        await api.atualizarParto(recParto, widget.token);
        //print(widget.usuario_id.toString()3);
        print('dentro do PartoPage' + recParto.toString());
      } else {
        await api.cadastroParto(recParto, widget.token);
        //print(widget.usuario_id);
        print('dentro do PartoPage' + recParto.toString());
      }
      _getAllPartos();
    }
  }

  void _orderList(OrderOptions result, {Parto parto}) async {
    switch (result) {
      case OrderOptions.cadastrar:
        _showPartoPage();
        break;
//      case OrderOptions.orderza:
//        ordenha.sort((a, b) {
//          return b.coleta.toLowerCase().compareTo(a.coleta.toLowerCase());
//        });
//        break;
    }
    setState(() {});
  }

  Widget _partoCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text('Vaca: ' + parto[index].nomeBovino),
              subtitle: Text('Parto no Dia: ' + parto[index].data.toString()),
              trailing: Text(parto[index].nascido),
            )),
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
                    'Modificar',
                    style: TextStyle(color: Colors.deepOrange, fontSize: 15.0),
                  )
                ],
              ))
        ],
      ),
      onPressed: () {
        Navigator.pop(context);
        _showPartoPage(parto: parto[index]);
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
                    'Apagar',
                    style: TextStyle(color: Colors.deepOrange, fontSize: 15.0),
                  )
                ],
              ))
        ],
      ),
      onPressed: () {
        api.deletarParto(parto[index].id, widget.token);
        setState(() {
          parto.removeAt(index);
          Navigator.pop(context);
        });
      },
    ));
    dialog.showBottomOptions(context, botoes);
  }
}
