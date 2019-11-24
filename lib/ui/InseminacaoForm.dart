import 'dart:async';
import 'package:flutter/material.dart';
import '../helper/inseminacao_helper.dart';
import '../helper/bovino_helper.dart';
import '../helper/Api.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class InseminacaoForm extends StatefulWidget {
  final Inseminacao inseminacao;
  final token;

  InseminacaoForm({this.inseminacao, this.token});

  @override
  _InseminacaoFormState createState() => _InseminacaoFormState();
}

class _InseminacaoFormState extends State<InseminacaoForm> {
  final _bovino_idController = TextEditingController();
  final _raca_idController = TextEditingController();
  final _dataController = TextEditingController();
  final _formInseminacao = GlobalKey<FormState>();
  final formatoData = new DateFormat("yyyy-MM-dd");

  Api api = new Api();
  Inseminacao _editedInseminacao;
  bool _userEdited = false;
  String _mySelection;
  String dataSelecionada = '';
  List<Bovino> bovinosGet = List();

  var isLoading = false;

  _getAllBovinos() async {
    api.bovinos(widget.token).then((list) {
      setState(() {
        isLoading = false;
        bovinosGet = list;
        //print('_getAllBovinos'+widget.token.toString());
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getAllBovinos();
    isLoading = true;
    if (widget.inseminacao == null) {
      _editedInseminacao = Inseminacao();
    } else {
      _editedInseminacao = Inseminacao.fromJson(widget.inseminacao.toJson());
      _bovino_idController.text = _editedInseminacao.bovino_id;
      _raca_idController.text = _editedInseminacao.raca_id;
      _dataController.text = _editedInseminacao.data;
      //_dataController.text = _editedInseminacao.nomeBovino;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _requestPop,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            title: Text(_editedInseminacao.nomeBovino ?? 'Novo Registro de Inseminacao'),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.save),
              backgroundColor: Colors.deepOrange,
              onPressed: () {
                if (_formInseminacao.currentState.validate()) {
                  Navigator.pop(context, _editedInseminacao);
                }
              }),
          body: SingleChildScrollView(
              padding: EdgeInsets.all(10.0),
              child: Form(
                key: _formInseminacao,
                child: Column(
                  children: <Widget>[
                    DropdownButton(
                      items: bovinosGet.map((item) {
                        // print('dentro do dropdwon');
                        //print(bovinos);
                        return new DropdownMenuItem(
                          child: new Text(item.nome),
                          value: item.id.toString(),
                        );
                      }).toList(),
                      onChanged: (novoValor) {
                        setState(() {
                          _mySelection = novoValor;
                          //print(_mySelection);
                          _editedInseminacao.bovino_id = novoValor;
                        });
                      },
                      isExpanded: true,
                      value: _editedInseminacao.bovino_id,
                      hint: Text(
                        'Informe qual Vaca foi Inseminacaoda',
                        style: TextStyle(color: Colors.deepOrange),
                      ),
                    ),
                    TextFormField(
                        decoration: InputDecoration(labelText: "Digite a Quantidade de Leite Produzida"),
                        onChanged: (text) {
                          _userEdited = true;
                          _editedInseminacao.raca_id = text;
                        },
                        keyboardType: TextInputType.number,
                        controller: _raca_idController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'É Obrigatório Informar a Quantidade de Leite Produzido';
                          }
                          return null;
                        }),
                    FlatButton(
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(1999, 1, 1),
                              maxTime: DateTime(2019, 12, 31),
                              theme: DatePickerTheme(
                                  backgroundColor: Colors.orange,
                                  itemStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  doneStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16)),
                           onConfirm: (date) {
                            //print(new DateFormat("dd-MM-yyyy").format(date));
                            _dataController.text = formatoData.format(date);
                            setState(() {
                              dataSelecionada = _dataController.text;
                              _editedInseminacao.data = dataSelecionada;
                              //print('dataSelecionada $dataSelecionada');
                            });
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.pt);
                        },
                        child: Text(
                          'Selecione a Data de Coleta',
                          style: TextStyle(color: Colors.deepOrange),
                        )),
                    TextFormField(
                        decoration: InputDecoration(labelText: 'Data informada:'),
                        onChanged: (dataSelecionada) {
                          _userEdited = true;
                          _editedInseminacao.data = dataSelecionada;
                        },
                        controller: _dataController,
                        validator: (dataSelecionada) {
                          if (dataSelecionada.isEmpty) {
                            return 'É nescessário selecinar a Data de Inseminação';
                          }
                          return null;
                        }),
                    RaisedButton(
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      child: Text("Conferir"),
                      elevation: 3,
                      color: Colors.white,
                      textColor: Colors.blueAccent,
                      onPressed: () {
//                        _getAllBovinos();
//                        print('tttf'+_editedInseminacao.nomeBovino.toString());
                      },
                    )
                  ],
                ),
              )),
        ));
  }

  Future<bool> _requestPop() {
    if (_userEdited) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Descartar alterações?'),
              content: Text('Se sair as alterações serão perdidas.'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text('Sim'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
