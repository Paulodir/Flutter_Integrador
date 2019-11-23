import 'package:flutter/material.dart';
import '../helper/login_helper.dart';
import '../utils/Dialogs.dart';
import '../helper/Api.dart';
import 'package:flutter_integrador/ui/LoginPage.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  LoginHelper helper = LoginHelper();
  Dialogs dialog = new Dialogs();
  Api api = new Api();

  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _nomeFocus = FocusNode();
  final _formCadastro = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
            child: Form(
              key: _formCadastro,
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.deepOrange, Colors.orange],
                        ),
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(90))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Spacer(),
                        Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.person_add,
                            size: 90,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 32, right: 32),
                            child: Text(
                              'Cadastro Produtor',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 62),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 45,
                          padding: EdgeInsets.only(
                              top: 4, left: 16, right: 16, bottom: 4),
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 5)
                              ]),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Digite seu Nome",
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),
                            ),
                              focusNode: _nomeFocus,
                              controller: _nomeController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'É Obrigatório Informar Seu Nome!';
                                }
                                return null;
                              }),
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 45,
                          padding: EdgeInsets.only(
                              top: 4, left: 16, right: 16, bottom: 4),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 5)
                              ]),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Cadastre um Email",
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.email,
                                color: Colors.grey,
                              ),
                            ),

                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                              /*validator: (value) {
                                if (value.isEmpty) {
                                  return 'Digite seu email';
                                }
                                return null;
                              }*/
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 45,
                          margin: EdgeInsets.only(top: 32),
                          padding: EdgeInsets.only(
                              top: 4, left: 16, right: 16, bottom: 4),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 5)
                              ]),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.vpn_key,
                                color: Colors.grey,
                              ),
                              hintText: 'Cadastre uma Senha',
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            controller: _senhaController,
                            obscureText: true,
                          ),
                        ),

                        Spacer(),
                        GestureDetector(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 45,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [Colors.deepOrange, Colors.orange],
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  child: Center(
                                    child: Text(
                                      'Cadastrar'.toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () async {
                              if (_formCadastro.currentState.validate()) {
                                if (await api.cadastro(
                                    _nomeController.text,
                                    _emailController.text,
                                    _senhaController.text) !=
                                    null) {
                                  Login user = await api.login(
                                      _emailController.text, _senhaController.text);
                                  Navigator.pop(context);
                                  if (user != null) {
                                    helper.saveLogado(user.id, user.nome, user.token);
                                    Navigator.pop(context);
                                    await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginPage()));
                                  }
                                } else {
                                  dialog.showAlertDialog(
                                      context, 'Aviso', 'Usuário não cadastrado');
                                }
                              }
                            }),
                        Spacer(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

    );
  }
}
