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
  String dataSelecionada = '';
  List<Bovino> bovinosGet = List();
  List<Raca> racasGet = List();

  var isLoading = false;

  _getAllBovinos() async {
    api.bovinos(widget.token).then((list) {
      setState(() {
        bovinosGet = list;
        isLoading = false;
        //print('_getAllBovinos'+widget.token.toString());
      });
    });
  }
  // var isLoading = false;

  _getAllRacas() async {
    api.racas(widget.token).then((list) {
      setState(() {
        racasGet = list;
        isLoading = false;
        // print('_getAllRacas'+widget.token.toString());
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getAllBovinos();
    _getAllRacas();
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
            title: Text(_editedInseminacao.nomeBovino ??
                'Novo Registro de Inseminação'),
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
                          //_mySelection = novoValor;
                          //print(_mySelection);
                          _editedInseminacao.bovino_id = novoValor;
                        });
                      },
                      isExpanded: true,
                      value: _editedInseminacao.bovino_id,
                      hint: Text(
                        'Informe qual Vaca foi Inseminada',
                        style: TextStyle(color: Colors.deepOrange),
                      ),
                    ),
                    DropdownButton(
                      items: racasGet.map((item) {
                        // print('dentro do dropdwon');
                        //print(racas);
                        return new DropdownMenuItem(
                          child: new Text(item.nome),
                          value: item.id.toString(),
                        );
                      }).toList(),
                      onChanged: (novoValor) {
                        setState(() {
                          //_mySelection = novoValor;
                          //print(_mySelection);
                          _editedInseminacao.raca_id = novoValor;
                        });
                      },
                      isExpanded: true,
                      value: _editedInseminacao.raca_id,
                      hint: Text(
                        'Selecione a Raça do Sêmen Usuado',
                        style: TextStyle(color: Colors.deepOrange),
                      ),
                    ),
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
                                      fontSize: 16)), onConfirm: (date) {
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
                          'Selecione a Data de Inseminação',
                          style: TextStyle(color: Colors.deepOrange),
                        )),
                    TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Data informada:'),
                        onChanged: (dataSelecionada) {
                          _userEdited = true;
                          _editedInseminacao.data = dataSelecionada;
                        },
                        controller: _dataController,
                        validator: (dataSelecionada) {
                          if (dataSelecionada.isEmpty) {
                            return 'É nescessário selecionar a Data de Inseminação';
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
                        _getAllRacas;
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
