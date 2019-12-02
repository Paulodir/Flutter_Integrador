import 'package:flutter/material.dart';
import 'InseminacaoForm.dart';
import '../helper/inseminacao_helper.dart';
import '../utils/Dialogs.dart';
import 'package:flutter_integrador/ui/Menu.dart';
import '../helper/Api.dart';

class InseminacaoPage extends StatefulWidget {
  final String token;

  InseminacaoPage(this.token);

  @override
  _InseminacaoPageState createState() => _InseminacaoPageState();
}

enum OrderOptions {cadastrar}

class _InseminacaoPageState extends State<InseminacaoPage> {
  Dialogs dialog = new Dialogs();
  // LoginHelper helperLog = LoginHelper();
  InseminacaoHelper helper = InseminacaoHelper();
  List<Inseminacao> inseminacao = List();
  Api api = new Api();

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    _getAllInseminacaos();
  }

  _getAllInseminacaos() async {
    api.inseminacoes(widget.token).then((list) {
      setState(() {
        isLoading = false;
        inseminacao = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Text('Inseminações'),
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
//              onPressed: ({Inseminacao inseminacao}) {
//                _showInseminacaoPage();
//              },
//            ),
            PopupMenuButton<OrderOptions>(
                child: Icon(Icons.add),
                itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
                  const PopupMenuItem<OrderOptions>(
                    child: Text('Registrar Inseminação'),
                    value: OrderOptions.cadastrar,
                  ),
                ],
                onSelected: _orderList)
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
                    itemCount: inseminacao.length,
                    itemBuilder: (context, index) {
                      return _inseminacaoCard(context, index);
                    }),
            onWillPop: () {
              return null;
            }));
  }

  void _showInseminacaoPage({Inseminacao inseminacao}) async {
    final recInseminacao = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => InseminacaoForm(
                  inseminacao: inseminacao,
                  token: widget.token,
                )));
    if (recInseminacao != null) {
      if (inseminacao != null) {
        await api.atualizarInseminacao(recInseminacao, widget.token);
        // print(widget.usuario_id);
        print(recInseminacao);
      } else {
        await api.cadastroInseminacao(recInseminacao, widget.token);
        //print(widget.usuario_id);
        print(recInseminacao);
      }
      _getAllInseminacaos();
    }
  }

  void _orderList(OrderOptions result, {Inseminacao inseminacao}) async {
    switch (result) {
      case OrderOptions.cadastrar:
        _showInseminacaoPage();
        break;
//      case OrderOptions.orderza:
//        ordenha.sort((a, b) {
//          return b.coleta.toLowerCase().compareTo(a.coleta.toLowerCase());
//        });
//        break;
    }
    setState(() {});
  }


  Widget _inseminacaoCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
            padding: EdgeInsets.all(0.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('Vaca: ' + inseminacao[index].nomeBovino),
                  subtitle: Text('Inseminação no Dia:\n' + inseminacao[index].data),
                  trailing: Text('Sêmen Raça:\n'+inseminacao[index].nomeRaca),
                ),
                ListTile(
                  leading: Text('Secagem:\n' + inseminacao[index].secagem),
                  title: Text('Previsão de Parto:\n' + inseminacao[index].previsao),
                  trailing: Text('Ração Pré Parto:\n' + inseminacao[index].pre_parto),
                ),
              ],
            ),
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
                    'Modificar',
                    style: TextStyle(color: Colors.deepOrange, fontSize: 15.0),
                  )
                ],
              ))
        ],
      ),
      onPressed: () {
        Navigator.pop(context);
        _showInseminacaoPage(inseminacao: inseminacao[index]);
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
        api.deletarInseminacao(inseminacao[index].id, widget.token);
        setState(() {
          inseminacao.removeAt(index);
          Navigator.pop(context);
        });
      },
    ));
    dialog.showBottomOptions(context, botoes);
  }
}
