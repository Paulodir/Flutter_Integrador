import 'package:flutter/material.dart';
import '../helper/racao_helper.dart';
import '../utils/Dialogs.dart';
import 'package:flutter_integrador/ui/Menu.dart';
import '../helper/Api.dart';

class RacaoPage extends StatefulWidget {
  final String token;

  RacaoPage(this.token);

  @override
  _RacaoPageState createState() => _RacaoPageState();
}

enum OrderOptions { cadastrar }

class _RacaoPageState extends State<RacaoPage> {
  Dialogs dialog = new Dialogs();
  RacaoHelper helper = RacaoHelper();
  List<Racao> racao = List();
  Api api = new Api();

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    _getAlimentacao();
  }

  _getAlimentacao() async {
    api.alimentacao(widget.token).then((list) {
      setState(() {
        isLoading = false;
        racao = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Text('Recomendação Ração'),
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
//          actions: <Widget>[
//            PopupMenuButton<OrderOptions>(
//                child: Icon(Icons.add),
//                //elevation:5,
//                itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
//                  const PopupMenuItem<OrderOptions>(
//                    child: Text('Registrar Racao'),
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
                    itemCount: racao.length,
                    itemBuilder: (context, index) {
                      return _racaoCard(context, index);
                    }),
            onWillPop: () {
              return null;
            }));
  }

//  void _showRacaoPage({Racao racao}) async {
//    final recRacao = await Navigator.push(
//        context,
//        MaterialPageRoute(
//            builder: (context) => RacaoForm(
//              racao: racao,
//              token: widget.token,
//            )));
//    if (recRacao != null) {
//      if (racao != null) {
//        await api.atualizarRacao(recRacao, widget.usuario_id, widget.token);
//        // print(widget.usuario_id);
//        print(recRacao);
//      } else {
//        await api.cadastroRacao(recRacao, widget.usuario_id, widget.token);
//        //print(widget.usuario_id);
//        print(recRacao);
//      }
//      _getResumo();
//    }
//  }

  Widget _racaoCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
//        color: (
//            (int.parse(racao[index].vazia)> 120) ? Colors.red : (int.parse(racao[index].vazia)> 90) ? Colors.cyan[600]:Colors.white
//        ),
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('Vaca: ' + racao[index].nome),
                subtitle: Text('Nº Brinco: ' + racao[index].brinco),
                trailing: Text('Ração recomendada por Dia:\n'+racao[index].racaoDia),
              ),
              ListTile(
                title: Text(
                    'Média de Produção Últimos 30 Dias:\n'
                    +double.parse(racao[index].mediaproducao).toStringAsFixed(4).replaceAll('.', ',')
                ),
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
}
