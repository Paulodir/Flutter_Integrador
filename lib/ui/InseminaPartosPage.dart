import 'package:flutter/material.dart';
import '../helper/inseminaPartos_helper.dart';
import '../utils/Dialogs.dart';
import 'package:flutter_integrador/ui/Menu.dart';
import '../helper/Api.dart';

class InseminaPartosPage extends StatefulWidget {
  final String token;

  InseminaPartosPage(this.token);

  @override
  _InseminaPartosPageState createState() => _InseminaPartosPageState();
}

enum OrderOptions { cadastrar }

class _InseminaPartosPageState extends State<InseminaPartosPage> {
  Dialogs dialog = new Dialogs();
  InseminaPartosHelper helper = InseminaPartosHelper();
  List<InseminaPartos> inseminaPartos = List();
  Api api = new Api();
  final corAzul = Colors.blue;

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    _getResumo();
  }

  _getResumo() async {
    api.relacao(widget.token).then((list) {
      setState(() {
        isLoading = false;
        inseminaPartos = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Text('Detalhamento de Partos'),
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
//          actions: <Widget>[
//            PopupMenuButton<OrderOptions>(
//                child: Icon(Icons.add),
//                //elevation:5,
//                itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
//                  const PopupMenuItem<OrderOptions>(
//                    child: Text('Registrar InseminaPartos'),
//                    value: OrderOptions.cadastrar,
//                  ),
//                ],
//                onSelected: _orderList),
//          ],
        ),
        backgroundColor: Colors.lightGreen,
        body: WillPopScope(
            child: (isLoading)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemCount: inseminaPartos.length,
                    itemBuilder: (context, index) {
                      return _inseminaPartosCard(context, index);
                    }),
            onWillPop: () {
              return null;
            }));
  }

//  void _showInseminaPartosPage({InseminaPartos inseminaPartos}) async {
//    final recInseminaPartos = await Navigator.push(
//        context,
//        MaterialPageRoute(
//            builder: (context) => InseminaPartosForm(
//              inseminaPartos: inseminaPartos,
//              token: widget.token,
//            )));
//    if (recInseminaPartos != null) {
//      if (inseminaPartos != null) {
//        await api.atualizarInseminaPartos(recInseminaPartos, widget.usuario_id, widget.token);
//        // print(widget.usuario_id);
//        print(recInseminaPartos);
//      } else {
//        await api.cadastroInseminaPartos(recInseminaPartos, widget.usuario_id, widget.token);
//        //print(widget.usuario_id);
//        print(recInseminaPartos);
//      }
//      _getResumo();
//    }
//  }

  Widget _inseminaPartosCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
//        color: (
//            (int.parse(inseminaPartos[index].vazia)> 120) ? Colors.red : (int.parse(inseminaPartos[index].vazia)> 90) ? Colors.cyan[600]:Colors.white
//        ),
        child: Padding(
            padding: EdgeInsets.all(0.0),
            child:  Column(
              children: <Widget>[
                ListTile(
                  title: Text('Vaca: ' + inseminaPartos[index].nome),
                  trailing: Text('Total de Inseminações:\n ' + inseminaPartos[index].inseminacoes, style: TextStyle( fontSize: 14.0)),
                ),
                ListTile(
                  title: Text('Nascimentos: ' + inseminaPartos[index].partos, style: TextStyle(color: Colors.black, fontSize: 14.0)),
                  subtitle: Text('Abortos: ' + inseminaPartos[index].abortos, style: TextStyle(color: Colors.black, fontSize: 14.0)),
                  trailing: Text('Total de Partos:'+inseminaPartos[index].total, style: TextStyle(color: Colors.black, fontSize: 14.0)),
                ),
              ],
            ),
        ),
      ),
//      onTap: () {
//        _showOptions(context, index);
//      },
    );
  }
//  void _showOptions(BuildContext context, int index) {
//    List<Widget> botoes = [];
//    botoes.add(FlatButton(
//      child: Row(
//        children: <Widget>[
//          Icon(Icons.edit, color: Colors.deepOrange),
//          Padding(
//              padding: EdgeInsets.only(left: 10),
//              child: Column(
//                children: <Widget>[
//                  Text(
//                    'Atualizar Informações',
//                    style: TextStyle(color: Colors.deepOrange, fontSize: 14.0),
//                  )
//                ],
//              ))
//        ],
//      ),
//      onPressed: () {
//        Navigator.pop(context);
//        _showInseminaPartosPage(inseminaPartos: inseminaPartos[index]);
//      },
//    ));
//    botoes.add(FlatButton(
//      child: Row(
//        children: <Widget>[
//          Icon(Icons.delete, color: Colors.deepOrange),
//          Padding(
//              padding: EdgeInsets.only(left: 10),
//              child: Column(
//                children: <Widget>[
//                  Text(
//                    'Apagar Registro',
//                    style: TextStyle(color: Colors.deepOrange, fontSize: 14.0),
//                  )
//                ],
//              ))
//        ],
//      ),
//      onPressed: () {
//        api.deletarInseminaPartos(inseminaPartos[index].id, widget.token);
//        setState(() {
//          inseminaPartos.removeAt(index);
//          Navigator.pop(context);
//        });
//      },
//    ));
//    dialog.showBottomOptions(context, botoes);
//  }
//
//  void _orderList(OrderOptions result, {InseminaPartos inseminaPartos}) async {
//    switch (result) {
//      case OrderOptions.cadastrar:
//        _showInseminaPartosPage();
//        break;
////      case OrderOptions.orderza:
////        ordenha.sort((a, b) {
////          return b.coleta.toLowerCase().compareTo(a.coleta.toLowerCase());
////        });
////        break;
//    }
//    setState(() {});
//  }
}
