import 'dart:async';
import 'package:flutter/material.dart';
import '../helper/bovino_helper.dart';

class BovinoForm extends StatefulWidget {
  final Bovino bovino;
  final usuario_id;

  BovinoForm({this.bovino, this.usuario_id});

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

  Bovino _editedBovino;
  bool _userEdited = false;

  @override
  void initState() {
    super.initState();
    if (widget.bovino == null) {
      _editedBovino = Bovino();

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
                    TextFormField(
                        decoration: InputDecoration(labelText: "Raça"),
                        onChanged: (text) {
                          _userEdited = true;
                          _editedBovino.raca_id = text;
                        },
                        controller: _raca_idController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Digite a Raça do seu bovino';
                          }
                          return null;
                        }),
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
                            return 'Digite o nome do seu bovino';
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
                    TextFormField(
                        decoration: InputDecoration(labelText: "Data de Nascimento"),
                        onChanged: (text) {
                          _userEdited = true;
                          _editedBovino.nascimento = text;
                        },
                        controller: _nascimentoController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Digite a Data de Nascimento do seu bovino';
                          }
                          return null;
                        }),
                    TextFormField(
                        decoration: InputDecoration(labelText: "Peso"),
                        onChanged: (text) {
                          _userEdited = true;
                          _editedBovino.peso = text;
                        },
                        controller: _pesoController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Digite o Peso do seu Bovino';
                          }
                          return null;
                        }),
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
