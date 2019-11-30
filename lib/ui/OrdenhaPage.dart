import 'package:flutter/material.dart';
import 'OrdenhaForm.dart';
import 'package:url_launcher/url_launcher.dart';
import '../helper/ordenha_helper.dart';
import '../utils/Dialogs.dart';
import 'package:flutter_integrador/ui/Menu.dart';
import '../helper/Api.dart';

class OrdenhaPage extends StatefulWidget {
  final String token;

  OrdenhaPage(this.token);

  @override
  _OrdenhaPageState createState() => _OrdenhaPageState();
}

enum OrderOptions { cadastrar }

class _OrdenhaPageState extends State<OrdenhaPage> {
  Dialogs dialog = new Dialogs();
  // LoginHelper helperLog = LoginHelper();
  OrdenhaHelper helper = OrdenhaHelper();
  List<Ordenha> ordenha = List();
  Api api = new Api();

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    _getAllOrdenhas();
  }

  _getAllOrdenhas() async {
    api.ordenhas(widget.token).then((list) {
      setState(() {
        isLoading = false;
        ordenha = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Text('Ordenhas Registradas'),
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
          actions: <Widget>[
            PopupMenuButton<OrderOptions>(
                itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
                      const PopupMenuItem<OrderOptions>(
                        child: Text('Cadastrar Ordenha'),
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
        body: WillPopScope(
            child: (isLoading)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemCount: ordenha.length,
                    itemBuilder: (context, index) {
                      return _ordenhaCard(context, index);
                    }),
            onWillPop: () {
              return null;
            }));
  }

  void _showOrdenhaPage({Ordenha ordenha}) async {
    final recOrdenha = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OrdenhaForm(
                  ordenha: ordenha,
                  token: widget.token,
                )));
    if (recOrdenha != null) {
      if (ordenha != null) {
        await api.atualizarOrdenha(recOrdenha, widget.token);
        // print(widget.usuario_id);
        print(recOrdenha);
      } else {
        await api.cadastroOrdenha(recOrdenha, widget.token);
        //print(widget.usuario_id);
        print(recOrdenha);
      }
      _getAllOrdenhas();
    }
  }

  void _orderList(OrderOptions result, {Ordenha ordenha}) async {
    switch (result) {
      case OrderOptions.cadastrar:
        _showOrdenhaPage();
        break;
//      case OrderOptions.orderza:
//        ordenha.sort((a, b) {
//          return b.coleta.toLowerCase().compareTo(a.coleta.toLowerCase());
//        });
//        break;
    }
    setState(() {});
  }

  Widget _ordenhaCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text('Vaca: ' + ordenha[index].nomeBovino),
              subtitle:
                  Text('Leite Produzido: ' + ordenha[index].leite + ' litros'),
              trailing: Text('Coleta: ' + ordenha[index].coleta),
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
        _showOrdenhaPage(ordenha: ordenha[index]);
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
        api.deletarOrdenha(ordenha[index].id, widget.token);
        setState(() {
          ordenha.removeAt(index);
          Navigator.pop(context);
        });
      },
    ));
    dialog.showBottomOptions(context, botoes);
  }
}
