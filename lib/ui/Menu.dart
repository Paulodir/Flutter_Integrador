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
import 'package:flutter_integrador/ui/RacaoPage.dart';
import 'package:flutter_integrador/ui/InseminaPartosPage.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  LoginHelper helper = LoginHelper();
//  List<Login> login = List();
  Dialogs dialog = new Dialogs();
  Api api = new Api();
  String atual='';

  String nomeLogado;
  String tokenLogado;
  int usuarioLogado;


  void _getUsuarioLogado() async {
    nomeLogado = await helper.getLogadoNome();
    tokenLogado = await helper.getLogado();
    usuarioLogado = await helper.getLogadoid();
    print('nome do usuario $nomeLogado');
    setState(() {
      atual=nomeLogado;
    });

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
              "Produtor $atual",
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
            title: Text('Resumo do Rebanho', style: TextStyle(fontSize: 20)),
            leading:Image.asset('images/home.png'),
            onTap: () async {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage(tokenLogado)),
              );
            },
          ),
          ListTile(
            title: Text('Recomendação Ração', style: TextStyle(fontSize: 20)),
            leading: Image.asset('images/cow.png'),
            onTap: () async {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => RacaoPage(tokenLogado)),
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
            title: Text('Registro de Ordenhas', style: TextStyle(fontSize: 20)),
            leading: Image.asset('images/milk.png'),
            onTap: () async {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrdenhaPage(tokenLogado)));
            },
          ),
          ListTile(
            leading: Image.asset('images/syringe.png'),
            title: Text('Registro Inseminações', style: TextStyle(fontSize: 20)),
            onTap: () async {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InseminacaoPage(tokenLogado)));
            },
          ),
          ListTile(
            leading: Image.asset('images/bezerro.png'),
            title: Text('Partos', style: TextStyle(fontSize: 20)),
            onTap: () async {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PartoPage(tokenLogado)));
            },
          ),
          ListTile(
            title: Text('Detalhamento Partos', style: TextStyle(fontSize: 20)),
            leading: Image.asset('images/detalhes.png'),
            onTap: () async {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => InseminaPartosPage(tokenLogado)),
              );
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
