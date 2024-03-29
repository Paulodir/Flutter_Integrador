import 'package:flutter/material.dart';
import '../helper/home_helper.dart';
import '../utils/Dialogs.dart';
import 'package:flutter_integrador/ui/Menu.dart';
import '../helper/Api.dart';

class HomePage extends StatefulWidget {
  final String token;

  HomePage(this.token);

  @override
  _HomePageState createState() => _HomePageState();
}

enum OrderOptions {cadastrar}

class _HomePageState extends State<HomePage> {
  Dialogs dialog = new Dialogs();
  HomeHelper helper = HomeHelper();
  List<Home> home = List();
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
    api.resumo(widget.token).then((list) {
      setState(() {
        isLoading = false;
        home = list;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Text('Resumo do Rebanho'),
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
//          actions: <Widget>[
//            PopupMenuButton<OrderOptions>(
//                child: Icon(Icons.add),
//                //elevation:5,
//                itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
//                  const PopupMenuItem<OrderOptions>(
//                    child: Text('Registrar Home'),
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
                itemCount: home.length,
                itemBuilder: (context, index) {
                  return _homeCard(context, index);
                }),
            onWillPop: () {
              return null;
            }));
  }

//  void _showHomePage({Home home}) async {
//    final recHome = await Navigator.push(
//        context,
//        MaterialPageRoute(
//            builder: (context) => HomeForm(
//              home: home,
//              token: widget.token,
//            )));
//    if (recHome != null) {
//      if (home != null) {
//        await api.atualizarHome(recHome, widget.usuario_id, widget.token);
//        // print(widget.usuario_id);
//        print(recHome);
//      } else {
//        await api.cadastroHome(recHome, widget.usuario_id, widget.token);
//        //print(widget.usuario_id);
//        print(recHome);
//      }
//      _getResumo();
//    }
//  }

  Widget _homeCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        color: (
            (int.parse(home[index].vazia)> 120) ? Colors.red : (int.parse(home[index].vazia)> 90) ? Colors.cyan[600]:Colors.white
        ),
        child: Padding(
            padding: EdgeInsets.all(0.0),
            child:  Column(
              children: <Widget>[
                ListTile(
                  title: Text('Vaca: ' + home[index].nome),
                  subtitle: Text('Aguardando Inseminação:\n ' + home[index].vazia+' dias'),
                  trailing: Text('Vaca Prenha ou Vazia:\n'+home[index].status),
                ),
                ListTile(
                  title: Text('Última Inseminação:\n' + home[index].ultimaInseminacao),
                  trailing: Text('Último Parto:\n' +home[index].ultimoParto),
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
//                    style: TextStyle(color: Colors.deepOrange, fontSize: 15.0),
//                  )
//                ],
//              ))
//        ],
//      ),
//      onPressed: () {
//        Navigator.pop(context);
//        _showHomePage(home: home[index]);
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
//                    style: TextStyle(color: Colors.deepOrange, fontSize: 15.0),
//                  )
//                ],
//              ))
//        ],
//      ),
//      onPressed: () {
//        api.deletarHome(home[index].id, widget.token);
//        setState(() {
//          home.removeAt(index);
//          Navigator.pop(context);
//        });
//      },
//    ));
//    dialog.showBottomOptions(context, botoes);
//  }
//
//  void _orderList(OrderOptions result, {Home home}) async {
//    switch (result) {
//      case OrderOptions.cadastrar:
//        _showHomePage();
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
