import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_integrador/ui/HomePage.dart';
import 'package:flutter_integrador/helper/login_helper.dart';
import 'package:flutter_integrador/ui/LoginPage.dart';

void main() async {
  LoginHelper helper = LoginHelper();
  //get usuario_id e token
  String logado = await helper.getLogado();
  int usuario_id = await helper.getLogadoid();
  //print("aqui aqui");print(usuario_id);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(MaterialApp(
    home: (logado != null) ? HomePage() : LoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}
/*void main() => runApp( MyApp());*/
