import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../helper/parto_helper.dart';
import '../helper/bovino_helper.dart';
import '../helper/Api.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_integrador/utils/Strings.dart';

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
  final GlobalKey<FormBuilderState> _formParto = GlobalKey<FormBuilderState>();

  Api api = new Api();
  Parto _editedParto;
  bool _userEdited = false;
  List<Bovino> bovinosGet = List();

  var isLoading = false;

  _getAllBovinos() async {
    isLoading = false;
    api.bovinos(widget.token).then((list) {
      setState(() {
        bovinosGet = list;
        //print('_getAllBovinos'+widget.token.toString());
      });
    });
  }

  converteString() {
    isLoading = false;
    DateTime dataParto;
    if (_editedParto.data != '') {
      String d = _editedParto.data;
      String formatada =
          d[6] + d[7] + d[8] + d[9] + d[2] + d[3] + d[4] + d[5] + d[0] + d[1];
      dataParto = DateTime.parse(formatada);
    } else {
      //d[6]+d[7]+d[8]+d[9]+d[2]+d[3]+d[4]+d[5]+d[0]+d[1]
      dataParto = DateTime.now();
      //_editedParto.data=dataParto.toString();
    }
    return dataParto;
  }

  @override
  void initState() {
    super.initState();
    _getAllBovinos();
    if (widget.parto == null) {
      _editedParto = Parto();
      _editedParto.data = '';
      isLoading = true;
    } else {
      _editedParto = Parto.fromJson(widget.parto.toJson());
      _bovino_idController.text = _editedParto.bovino_id;
      _nascidoController.text = _editedParto.nascido;
      _dataController.text = _editedParto.data;
      isLoading = true;
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
            child: Column(
              children: <Widget>[
                FormBuilder(
                  // context,
                  key: _formParto,
                  autovalidate: true,
                  // readonly: true,
                  child: Column(
                    children: <Widget>[
                      FormBuilderDateTimePicker(
                          inputType: InputType.date,
                          initialValue: converteString(),
                          format: DateFormat("dd-MM-yyyy"),
                          validators: [FormBuilderValidators.required()],
                          decoration: InputDecoration(
                            labelText: "Selecione a Data do Parto ou Aborto",
                            icon: const Icon(Icons.calendar_today),
                            hintText: "Selecione Uma Opção",
                          ),
                          onChanged: (value) {
                            print('mudou data$value');
                            setState(() {
                              _editedParto.data = value.toString();
                              print('dataSelecionada ' + _editedParto.data);
                            });
                          }),
                      FormBuilderDropdown(
                        //attribute: "gender",
                        decoration: InputDecoration(
                          labelText: "Bovino",
                          icon: const Icon(Icons.category),
                          hintText: "Selecione uma Opção",
                        ),
                        initialValue: _editedParto.bovino_id,
                        hint: Text('Informe qual Vaca Pariu'),
                        style: TextStyle(color: Colors.deepOrange),
                        validators: [FormBuilderValidators.required()],
                        items: bovinosGet.map((item) {
                          // print('dentro do dropdwon');
                          //print(bovinos);
                          return new DropdownMenuItem(
                            child: new Text(item.nome),
                            value: item.id.toString(),
                          );
                        }).toList(),
                        isExpanded: true,
                        onChanged: (novoValor) {
                          setState(() {
                            _editedParto.bovino_id = novoValor;
                          });
                        },
                        //value: ,
                      ),
                      FormBuilderRadio(
                        decoration: InputDecoration(
                          labelText: 'Informe o Tipo do Registro:',
                          icon: const Icon(Icons.language),
                          hintText: "Selecione Uma Opção",
                        ),
                        leadingInput: true,
                        onChanged: (opcao) {
                          setState(() {
                            print('mudou data ' + _editedParto.data.toString());
                            _editedParto.nascido = opcao;
                          });
                        },
                        initialValue: _editedParto.nascido,
                        validators: [FormBuilderValidators.required()],
                        options: [vivo, morto]
                            .map((tipo) => FormBuilderFieldOption(value: tipo))
                            .toList(growable: true),
                      ),
                    ],
                  ),
                ),
//                Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: MaterialButton(
//                        color: Theme.of(context).accentColor,
//                        child: Text(
//                          "Submit",
//                          style: TextStyle(color: Colors.white),
//                        ),
//                        onPressed: () {
//                          print(_editedParto.bovino_id);
//                          _formParto.currentState.save();
//                          if (_formParto.currentState.validate()) {
//                            print(_formParto.currentState.value);
//                          } else {
//                            print(_formParto.currentState.value);
//                            print("validation failed");
//                            _scaffoldKey.currentState.showSnackBar(SnackBar(
//                              content: Text('Validation failed'),
//                              duration: Duration(seconds: 3),
//                            ));
//                          }
//                        },
//                      ),
//                    ),
//                    SizedBox(
//                      width: 20,
//                    ),
//                    Expanded(
//                      child: MaterialButton(
//                        color: Theme.of(context).accentColor,
//                        child: Text(
//                          "Reset",
//                          style: TextStyle(color: Colors.white),
//                        ),
//                        onPressed: () {
//                          _formParto.currentState.reset();
//                        },
//                      ),
//                    ),
//                  ],
//                ),
              ],
            ),
          ),
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
