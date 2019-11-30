import 'dart:async';
import 'package:flutter/material.dart';
import '../helper/bovino_helper.dart';
import '../helper/Api.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class BovinoForm extends StatefulWidget {
  final Bovino bovino;
  final Raca raca;
  final usuario_id;
  final token;

  BovinoForm({this.bovino, this.usuario_id, this.raca, this.token});

  @override
  _BovinoFormState createState() => _BovinoFormState();
}

class _BovinoFormState extends State<BovinoForm> {
  final _raca_idController = TextEditingController();
  final _brincoController = TextEditingController();
  final _nomeController = TextEditingController();
  final _nascimentoController = TextEditingController();
  final _pesoController = TextEditingController();
  final _nomeFocus = FocusNode();

  final _formBovino = GlobalKey<FormState>();
  final formatoData = new DateFormat("yyyy-MM-dd");

  Api api = new Api();

  Bovino _editedBovino;
  Raca _editedRaca;
  bool _userEdited = false;
  //String _mySelection;
  String dataSelecionada = '';
  List<Raca> racasGet = List();
  var isLoading = false;

  _getAllRacas() async {
    api.racas(widget.token).then((list) {
      setState(() {
        isLoading = false;
        racasGet = list;
//        print('_getAllRacas'+widget.token.toString());
      });
    });
  }

  @override
  void initState() {
    super.initState();
    isLoading = true;
    _getAllRacas();
    if (widget.bovino == null) {
      _editedBovino = Bovino();
      _editedRaca = Raca();
    } else {
      _editedBovino = Bovino.fromJson(widget.bovino.toJson());
      _raca_idController.text = _editedBovino.raca_id;
      _brincoController.text = _editedBovino.brinco;
      _nomeController.text = _editedBovino.nome;
      _nascimentoController.text = _editedBovino.nascimento;
      _pesoController.text = _editedBovino.peso;
      _editedBovino.usuario_id = widget.usuario_id;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _requestPop,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            title: Text(_editedBovino.nome ?? 'Novo bovino'),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.save),
              backgroundColor: Colors.deepOrange,
              onPressed: () {
                if (_formBovino.currentState.validate()) {
                  Navigator.pop(context, _editedBovino);
                }
              }),
          body: SingleChildScrollView(
              padding: EdgeInsets.all(10.0),
              child: Form(
                key: _formBovino,
                child: Column(
                  children: <Widget>[
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
                          _editedBovino.raca_id = novoValor;
                        });
                      },
                      isExpanded: true,
                      value: _editedBovino.raca_id,
                      hint: Text(
                        'Selecione a Raça do Animal',
                        style: TextStyle(color: Colors.deepOrange),
                      ),
                    ),
                    TextFormField(
                        decoration: InputDecoration(labelText: "Nome"),
                        focusNode: _nomeFocus,
                        onChanged: (text) {
                          _userEdited = true;
                          _editedBovino.nome = text;
                        },
                        controller: _nomeController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Digite o nome do seu Bovino';
                          }
                          return null;
                        }),
                    TextFormField(
                        decoration: InputDecoration(labelText: "Nº do Brinco"),
                        onChanged: (text) {
                          _userEdited = true;
                          _editedBovino.brinco = text;
                        },
                        keyboardType: TextInputType.number,
                        controller: _brincoController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Digite o brinco do seu bovino';
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
                            _nascimentoController.text =
                                formatoData.format(date);
                            setState(() {
                              dataSelecionada = _nascimentoController.text;
                              _editedBovino.nascimento = dataSelecionada;
                              // print('dataSelecionada $dataSelecionada');
                            });
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.pt);
                        },
                        child: Text(
                          'Selecione a Data de Nascimento',
                          style: TextStyle(color: Colors.deepOrange),
                        )),
                    TextFormField(
                        decoration: InputDecoration(),
                        controller: _nascimentoController,
                        validator: (dataSelecionada) {
                          if (dataSelecionada.isEmpty) {
                            return 'É nescessário selecionar a Data de Nascimento';
                          }
                          return null;
                        }),
                    TextFormField(
                        decoration: InputDecoration(labelText: "Peso"),
                        onChanged: (text) {
                          _userEdited = true;
                          _editedBovino.peso = text;
                        },
                        keyboardType: TextInputType.number,
                        controller: _pesoController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Digite o Peso do seu Bovino';
                          }
                          return null;
                        }),

//                    FlatButton(
//                        onTap() {
//                    DatePicker.showDatePicker(context,
//                    showTitleActions: true,
//                    minTime: DateTime(2018, 3, 5),
//                    maxTime: DateTime(2019, 6, 7),
//                    onChanged: (date) {}, onConfirm: (date) {
//                    var formatter = new DateFormat('yyyy-MM-dd');
//
//                    dateControler.text = formatter.format(date);
//                    }, currentTime: DateTime.now(), locale: LocaleType.pt);
//                    }
//
//                    ),
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
