import 'dart:async';
import 'package:flutter/material.dart';
import '../helper/parto_helper.dart';
import '../helper/bovino_helper.dart';
import '../helper/Api.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class PartoForm extends StatefulWidget {
  final Parto parto;
  final token;

  PartoForm({this.parto, this.token});

  @override
  _PartoFormState createState() => _PartoFormState();
}

class _PartoFormState extends State<PartoForm> {
  final _bovino_idController = TextEditingController();
  final _nascidoController = TextEditingController();
  final _dataController = TextEditingController();
  final _nomeFocus = FocusNode();

  final _formParto = GlobalKey<FormState>();
  final formatoData = new DateFormat("yyyy-MM-dd");

  Api api = new Api();
  Parto _editedParto;
  Bovino _editedBovino;
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
    if (widget.parto == null) {
      _editedParto = Parto();
      _editedBovino = Bovino();
    } else {
      _editedParto = Parto.fromJson(widget.parto.toJson());
      _bovino_idController.text = _editedParto.bovino_id;
      _nascidoController.text = _editedParto.data;
      _dataController.text = _editedParto.data;
      //_dataController.text = _editedParto.nomeBovino;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _requestPop,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            title: Text(_editedParto.nomeBovino ?? 'Novo Registro de Parto'),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.save),
              backgroundColor: Colors.deepOrange,
              onPressed: () {
                if (_formParto.currentState.validate()) {
                  Navigator.pop(context, _editedParto);
                }
              }),
          body: SingleChildScrollView(
              padding: EdgeInsets.all(10.0),
              child: Form(
                key: _formParto,
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
                          _editedParto.bovino_id = novoValor;
                        });
                      },
                      isExpanded: true,
                      value: _editedParto.bovino_id,
                      hint: Text(
                        'Informe qual Vaca foi Partoda',
                        style: TextStyle(color: Colors.deepOrange),
                      ),
                    ),
                    TextFormField(
                        decoration: InputDecoration(labelText: "Digite a Quantidade de Leite Produzida"),
                        onChanged: (text) {
                          _userEdited = true;
                          _editedParto.nascido = text;
                        },
                        keyboardType: TextInputType.number,
                        controller: _nascidoController,
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
                              _editedParto.data = dataSelecionada;
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
                          _editedParto.data = dataSelecionada;
                        },
                        controller: _dataController,
                        validator: (dataSelecionada) {
                          if (dataSelecionada.isEmpty) {
                            return 'É nescessário selecinar a Data de Coleta do Leite';
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
//                        print('tttf'+_editedParto.nomeBovino.toString());
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
