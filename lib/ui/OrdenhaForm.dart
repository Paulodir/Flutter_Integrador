import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../helper/ordenha_helper.dart';
import '../helper/bovino_helper.dart';
import '../helper/Api.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_integrador/utils/Strings.dart';

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

  final GlobalKey<FormBuilderState> _formOrdenha = GlobalKey<FormBuilderState>();

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
  converteString() {
    isLoading = false;
    DateTime dataOrdenha;
    if (_editedOrdenha.coleta != '') {
      print('aqui aqui'+_editedOrdenha.coleta);
      String d = _editedOrdenha.coleta;
      String formatada =
          d[6] + d[7] + d[8] + d[9] + d[2] + d[3] + d[4] + d[5] + d[0] + d[1];
      dataOrdenha = DateTime.parse(formatada);
    } else {
      dataOrdenha = DateTime.now();
    }
    return dataOrdenha;
  }

  @override
  void initState() {
    super.initState();
    _getAllBovinos();
    isLoading = true;
    if (widget.ordenha == null) {
      _editedOrdenha = Ordenha();
      _editedOrdenha.coleta = '';
    } else {
      _editedOrdenha = Ordenha.fromJson(widget.ordenha.toJson());
      _bovino_idController.text = _editedOrdenha.bovino_id;
      _leiteController.text = _editedOrdenha.leite.replaceAll('.', ',');
      _descarteController.text = _editedOrdenha.descarte.replaceAll('.', ',');
      _coletaController.text = _editedOrdenha.coleta;
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
            child: Column(
              children: <Widget>[
                FormBuilder(
                  // context,
                  key: _formOrdenha,
                  autovalidate: true,
                  // readonly: true,
                  child: Column(
                    children: <Widget>[
                      FormBuilderDateTimePicker(
                          inputType: InputType.date,
                         // initialValue: converteString(),
                          format: DateFormat("dd-MM-yyyy"),
                          validators: [FormBuilderValidators.required()],
                          decoration: InputDecoration(
                            labelText: "Selecione a Data do Ordenha ou Aborto",
                            icon: const Icon(Icons.calendar_today),
                            hintText: "Selecione Uma Opção",
                          ),
                          onChanged: (value) {
                            print('mudou data$value');
                            String d = value.toString();
                            String formatada =
                                d[8] + d[9] + d[4] + d[5] + d[6] + d[7] + d[0] + d[1] + d[2] + d[3];
                            setState(() {
                              _editedOrdenha.coleta=formatada;
                              print('dataSelecionada ' + _editedOrdenha.coleta);
                            });
                          }),
                      FormBuilderDropdown(
                        decoration: InputDecoration(
                          labelText: "Bovino",
                          icon: const Icon(Icons.category),
                          hintText: "Selecione uma Opção",
                        ),
                        initialValue: _editedOrdenha.bovino_id,
                        hint: Text('Informe qual Vaca Foi Ordenhada'),
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
                            _editedOrdenha.bovino_id = novoValor;
                          });
                        },
                        //value: ,
                      ),
                      FormBuilderTextField(
                        focusNode: _nomeFocus,
                        onChanged: (text) {
                          _userEdited = true;
                          _editedOrdenha.leite = text;
                        },
                        decoration: InputDecoration(
                          labelText: 'Litros de Leite Ordenhado:',
                          icon: const Icon(Icons.plus_one),
                          hintText: "Selecione Uma Opção",
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [WhitelistingTextInputFormatter(new RegExp('[0-9\\,]'))],
                        controller: _leiteController,
                        validators: [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      FormBuilderTextField(
                        onChanged: (text) {
                         _userEdited = true;
                         _editedOrdenha.descarte = text;
                        },
                        decoration: InputDecoration(
                          labelText: 'Litros de Leite Descartado:',
                          icon: Icon(Icons.plus_one),
                          hintText: "Selecione Uma Opção",
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [WhitelistingTextInputFormatter(new RegExp('[0-9\\,]'))],
                        controller: _descarteController,
                        validators: [
                          FormBuilderValidators.required(),
                        ],
                      ),
                    ],
                  ),
                ),
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
