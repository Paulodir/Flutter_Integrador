import 'package:flutter/material.dart';
import 'package:flutter_integrador/helper/Api.dart';
import 'package:flutter_integrador/ui/LoginPage.dart';
import 'package:flutter_integrador/helper/login_helper.dart';
import 'package:flutter_integrador/utils/Dialogs.dart';
import 'package:flutter_integrador/ui/HomePage.dart';
import 'package:flutter_integrador/ui/BovinoPage.dart';
import 'package:flutter_integrador/ui/OrdenhaPage.dart';
import 'package:flutter_integrador/ui/InseminacaoPage.dart';
import 'package:flutter_integrador/ui/PartoPage.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  LoginHelper helper = LoginHelper();
//  List<Login> login = List();
  Dialogs dialog = new Dialogs();
  Api api = new Api();

  String _nomeLogado;
  String tokenLogado;
  int usuarioLogado;

  void _getUsuarioLogado() async {
    _nomeLogado = await helper.getLogadoNome();
    tokenLogado = await helper.getLogado();
    usuarioLogado = await helper.getLogadoid();
    print('nome do usuario $_nomeLogado');
  }

  @override
  void initState() {
    super.initState();
    _getUsuarioLogado();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "Produtor $_nomeLogado",
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
            decoration: BoxDecoration(
              color: Colors.deepOrange.withOpacity(0.2),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('images/produtor.png'),
            ),
          ),
          ListTile(
            title: Text('Resumo Leiteiro', style: TextStyle(fontSize: 20)),
            leading: Icon(
              Icons.insert_chart,
              color: Colors.deepOrange,
            ),
            onTap: () async {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            leading: Image.asset('images/bovino.png'),
            title: Text('Bovinos', style: TextStyle(fontSize: 20)),
            onTap: () async {
                  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BovinoPage(tokenLogado, usuarioLogado)));
            },
          ),
          ListTile(
            title: Text('Ordenha', style: TextStyle(fontSize: 20)),
            leading: Image.asset('images/bovino.png'),
            onTap: () async {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          OrdenhaPage(tokenLogado)));
            },
          ),
          ListTile(
            leading: Image.asset('images/bovino.png'),
            title: Text('Inseminações', style: TextStyle(fontSize: 20)),
            onTap: () async {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          InseminacaoPage(tokenLogado)));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.local_parking,
              color: Colors.deepOrange,
            ),
            title: Text('Partos', style: TextStyle(fontSize: 20)),
            onTap: () async {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PartoPage(tokenLogado)));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.highlight_off,
              color: Colors.red,
            ),
            title: Text(
              'Sair',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            onTap: () async {
              await helper.deleteLogado();
              Navigator.pop(context);
              await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}
