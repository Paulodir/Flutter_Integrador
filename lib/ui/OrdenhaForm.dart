import 'dart:async';
import 'package:flutter/material.dart';
import '../helper/ordenha_helper.dart';
import '../helper/bovino_helper.dart';
import '../helper/Api.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class OrdenhaForm extends StatefulWidget {
  final Ordenha ordenha;
  final token;

  OrdenhaForm({this.ordenha, this.token});

  @override
  _OrdenhaFormState createState() => _OrdenhaFormState();
}

class _OrdenhaFormState extends State<OrdenhaForm> {
  final _bovino_idController = TextEditingController();
  final _leiteController = TextEditingController();
  final _descarteController = TextEditingController();
  final _coletaController = TextEditingController();
  final _nomeFocus = FocusNode();

  final _formOrdenha = GlobalKey<FormState>();
  final formatoData = new DateFormat("yyyy-MM-dd");

  Api api = new Api();
  Ordenha _editedOrdenha;
  Bovino _editedBovino;
  bool _userEdited = false;
  //String _mySelection;
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
    if (widget.ordenha == null) {
      _editedOrdenha = Ordenha();
    } else {
      _editedOrdenha = Ordenha.fromJson(widget.ordenha.toJson());
      _bovino_idController.text = _editedOrdenha.bovino_id;
      _leiteController.text = _editedOrdenha.leite;
      _descarteController.text = _editedOrdenha.descarte;
      _coletaController.text = _editedOrdenha.coleta;
      //_coletaController.text = _editedOrdenha.nomeBovino;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _requestPop,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            title:
                Text(_editedOrdenha.nomeBovino ?? 'Novo Registro de Ordenha'),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.save),
              backgroundColor: Colors.deepOrange,
              onPressed: () {
                if (_formOrdenha.currentState.validate()) {
                  Navigator.pop(context, _editedOrdenha);
                }
              }),
          body: SingleChildScrollView(
              padding: EdgeInsets.all(10.0),
              child: Form(
                key: _formOrdenha,
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
                          _editedOrdenha.bovino_id = novoValor;
                        });
                      },
                      isExpanded: true,
                      value: _editedOrdenha.bovino_id,
                      hint: Text(
                        'Informe qual Vaca foi Ordenhada',
                        style: TextStyle(color: Colors.deepOrange),
                      ),
//                        validator: (value) {
//                          if (value.isEmpty) {
//                            return 'É Obrigatório Informar a Quantidade de Leite Produzido';
//                          }
//                          return null;
//                        }
                    ),
                    TextFormField(
                        decoration: InputDecoration(
                            labelText:
                                "Digite a Quantidade de Leite Produzida"),
                        onChanged: (text) {
                          _userEdited = true;
                          _editedOrdenha.leite = text;
                        },
                        keyboardType: TextInputType.number,
                        controller: _leiteController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'É Obrigatório Informar a Quantidade de Leite Produzido';
                          }
                          return null;
                        }),
                    TextFormField(
                        decoration: InputDecoration(
                            labelText:
                                "Digite a Quantidade de Leite Descartado"),
                        onChanged: (text) {
                          _userEdited = true;
                          _editedOrdenha.descarte = text;
                        },
                        keyboardType: TextInputType.number,
                        controller: _descarteController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'É Obrigatório Informar a Quantidade de Leite Descartado';
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
                                      fontSize: 16)), onConfirm: (date) {
                            //print(new DateFormat("dd-MM-yyyy").format(date));
                            _coletaController.text = formatoData.format(date);
                            setState(() {
                              dataSelecionada = _coletaController.text;
                              _editedOrdenha.coleta = dataSelecionada;
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
                        decoration:
                            InputDecoration(labelText: 'Data informada:'),
                        onChanged: (dataSelecionada) {
                          _userEdited = true;
                          _editedOrdenha.coleta = dataSelecionada;
                        },
                        controller: _coletaController,
                        validator: (dataSelecionada) {
                          if (dataSelecionada.isEmpty) {
                            return 'É nescessário selecionar a Data de Coleta do Leite';
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
//                        print('tttf'+_editedOrdenha.nomeBovino.toString());
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
