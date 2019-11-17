import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../helper/login_helper.dart';
import 'BovinoPage.dart';
import '../utils/Dialogs.dart';
import '../ui/LoginForm.dart';
import '../helper/Api.dart';

class LoginPage extends StatefulWidget {
  final Login login;

  LoginPage({this.login});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // f45d27
  // f5851f
  LoginHelper helper = LoginHelper();
  List<Login> login = List();
  Dialogs dialog = new Dialogs();
  Api api = new Api();

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _emaiLFocus = FocusNode();
  final _formLogin = GlobalKey<FormState>();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
          child: SingleChildScrollView(
            child: Form(
              key: _formLogin,
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFf45d27), Color(0xFFf5851f)],
                        ),
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(90))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Spacer(),
                        Image.asset('images/produtor.png'),

                        Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 32, right: 32),
                            child: Text(
                              'Acesso',
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
                              hintText: "Email",
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.email,
                                color: Colors.grey,
                              ),
                            ),
                            focusNode: _emaiLFocus,
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
                              hintText: 'Senha',
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            controller: _senhaController,
                            obscureText: true,
                          ),
                        ),

                        /* Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16, right: 32
                      ),
                      child: Text('Esqueceu sua Senha ?',
                        style: TextStyle(
                          color: Colors.grey
                        ),
                      ),
                    ),
                  ),*/
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
                                        colors: [
                                          Color(0xFFf45d27),
                                          Color(0xFFf5851f)
                                        ],
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  child: Center(
                                    child: Text(
                                      'Login'.toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () async {
                              if (_formLogin.currentState.validate()) {
                                Login user = await api.login(
                                    _emailController.text,
                                    _senhaController.text);
                                if (user != null) {
                                  helper.saveLogado(user.id, user.token);
                                  Navigator.pop(context);
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BovinoPage(user.token, user.id)));
                                } else {
                                  dialog.showAlertDialog(
                                      context, 'Aviso', 'Login Inválido');
                                }
                              }
                            }),
                        Spacer(),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16, right: 32),
                            child: Text(
                              'É seu primeiro acesso?',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
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
                                        colors: [
                                          Color(0xFFf45d27),
                                          Color(0xFFf5851f)
                                        ],
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  child: Center(
                                    child: Text(
                                      'Cadastre-se'.toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginForm()));
                            }),
                        Spacer(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          onWillPop: () {
            SystemNavigator.pop();
          }),
    );
  }
}
