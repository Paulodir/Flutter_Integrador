import 'dart:async';
import 'package:flutter/material.dart';
import '../helper/ordenha_helper.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class OrdenhaForm extends StatefulWidget {
  final Ordenha ordenha;
  final usuario_id;
  final token;


  OrdenhaForm({this.ordenha, this.usuario_id,this.token});

  @override
  _OrdenhaFormState createState() => _OrdenhaFormState();
}

class _OrdenhaFormState extends State<OrdenhaForm> {
  final _bovino_idController = TextEditingController();
  final _leiteController = TextEditingController();
  final _descarteController = TextEditingController();
  final _coletaController = TextEditingController();
  final _pesoController = TextEditingController();
  final _descarteFocus = FocusNode();


  final _formOrdenha = GlobalKey<FormState>();
  final formatoData = new DateFormat("yyyy-MM-dd");

  Ordenha _editedOrdenha;
  bool _userEdited = false;
  String _mySelection;
  String dataSelecionada='';




  @override
  void initState() {
    super.initState();
    if (widget.ordenha == null) {
      _editedOrdenha = Ordenha();
    } else {
      _editedOrdenha = Ordenha.fromJson(widget.ordenha.toJson());
      _bovino_idController.text = _editedOrdenha.bovino_id;
      _leiteController.text = _editedOrdenha.leite;
      _descarteController.text = _editedOrdenha.descarte;
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
            title: Text(_editedOrdenha.descarte ?? 'Novo ordenha'),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.save),
              backgroundColor: Colors.deepOrange,
              onPressed: () {
                print('dentro do save $_editedOrdenha');
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
//                    DropdownButton(
//                      items: racas.map((item) {
//                        // print('dentro do dropdwon');
//                        //print(racas);
//                        return new DropdownMenuItem(
//                          child: new Text(item['descarte']),
//                          value: item['id'].toString(),
//                        );
//                      }).toList(),
//                      onChanged: (novoValor) {
//                        setState(() {
//                          _mySelection = novoValor;
//                          //print(_mySelection);
//                          _editedOrdenha.bovino_id = novoValor;
//                        });
//                      },
//                      isExpanded: true,
//                      value: _editedOrdenha.bovino_id,
//                      hint: Text(
//                        'Selecione a Raça do Animal',
//                        style: TextStyle(color: Colors.deepOrange),
//                      ),
//                    ),
                    TextFormField(
                        decoration: InputDecoration(labelText: "Nome"),
                        focusNode: _descarteFocus,
                        onChanged: (text) {
                      _userEdited = true;
                      _editedOrdenha.descarte = text;
                    },
                        controller: _descarteController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Digite o descarte do seu Ordenha';
                          }
                          return null;
                        }),
                    TextFormField(
                        decoration: InputDecoration(labelText: "Nº do Brinco"),

                        keyboardType: TextInputType.number,
                        controller: _leiteController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Digite o leite do seu ordenha';
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
                                dataSelecionada= formatoData.format(date);
                                _coletaController.text=dataSelecionada;
                                print('Data enviada $date');
                              },
                              currentTime: DateTime.now(),
                              locale: LocaleType.pt);
                        },
                        child: Text(
                          'Selecione a Data de Nascimento',
                          style: TextStyle(color: Colors.deepOrange),
                        )),
                    TextFormField(
                        decoration:
                            InputDecoration(),
                        controller: _coletaController,
                        validator: (dataSelecionada) {
                          if (dataSelecionada.isEmpty) {
                            return 'É nescessário selecinar a Data de Nascimento';
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
