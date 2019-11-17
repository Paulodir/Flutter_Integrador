import 'dart:async';
import 'package:sqflite/sqflite.dart';
import '../utils/Strings.dart';
import '../helper/Databases.dart';

class LoginHelper {
  static final LoginHelper _instance = LoginHelper.internal();

  factory LoginHelper() => _instance;

  LoginHelper.internal();

  Databases databases = new Databases();

  Future<bool> saveLogado(int login_id, String tokens) async {
    Database dbLogado = await databases.db;
    Logado logado = new Logado();
    logado.id = 1;
    logado.logado_login_id = login_id;
    logado.token = tokens;
    //print("id");print(logado.id);
    //print("usuario_id");print(logado.logado_login_id);
    //print("Token");print(logado.token);
    if (await dbLogado.insert(logadoTable, logado.toMap()) > 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<int> getLogadoid() async {
    Database dbLogado = await databases.db;
    List<Map> maps = await dbLogado.rawQuery("SELECT * FROM $logadoTable");
    if (maps.length > 0) {
      Logado usuariologado = Logado.fromMap(maps.first);
      return usuariologado.logado_login_id;
    } else {
      return null;
    }
  }

  Future<String> getLogado() async {
    Database dbLogado = await databases.db;
    List<Map> maps = await dbLogado.rawQuery("SELECT * FROM $logadoTable");
    if (maps.length > 0) {
      Logado usuariologado = Logado.fromMap(maps.first);
      return usuariologado.token;
    } else {
      return null;
    }
  }

  Future<int> deleteLogado() async {
    Database dbLogin = await databases.db;
    await dbLogin.delete(logadoTable);
    return 1;
  }

  Future close() async {
    Database dbLogin = await databases.db;
    dbLogin.close();
  }
}

class Logado {
  int id;
  int logado_login_id;
  String token;

  Logado();

  Logado.fromMap(Map map) {
    id = map[idLogadoColumn];
    logado_login_id = map[login_idLogadoColumn];
    token = map[tokenColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      idLoginColumn: id,
      login_idLogadoColumn: logado_login_id,
      tokenColumn: token
    };
    return map;
  }
}

class Login {
  int id;
  String nome;
  String email;
  String senha;
  String token;

  Login();

  Login.fromMap(Map map) {
    id = int.parse(map[idLoginColumn]);
    email = map[emailLoginColumn];
    nome = map[nomeLoginColumn];
    senha = map[senhaLoginColumn];
    token = map[tokenLoginColumn];
  }

  @override
  String toString() {
    return "Login(id: $id, name: $nome, email: $email, senha: $senha, token: $token)";
  }
}
