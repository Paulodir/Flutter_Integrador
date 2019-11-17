import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login_helper.dart';
import 'bovino_helper.dart';

const BASE_URL = "http://paulodir.site/rest/";

class Api {
  String token;

  Api({this.token});

  Future<Login> login(String email, String senha) async {
    http.Response response = await http.post(BASE_URL + "login",
        body: jsonEncode({"senha": senha, "email": email}),
        headers: {'token': token, 'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      Login dadosJson = new Login.fromMap(json.decode(response.body));
      return dadosJson;
    } else {
      return null;
    }
  }

  Future<Login> cadastro(String nome, String email, String senha) async {
    http.Response response = await http.post(BASE_URL + "login/cadastro",
        body: jsonEncode({"senha": senha, "email": email, "nome": nome}),
        headers: {'token': token, 'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      Login dadosJson = new Login.fromMap(json.decode(response.body));
      return dadosJson;
    } else {
      return null;
    }
  }

  Future<Bovino> cadastroBovino(
      Bovino bovino, int usuario_id, String token) async {
    http.Response response = await http.post(BASE_URL + "Bovino",
        body: jsonEncode({
          "raca_id": bovino.raca_id,
          "brinco": bovino.brinco,
          "nome": bovino.nome,
          "nascimento": bovino.nascimento,
          "peso": bovino.peso,
          "usuario_id": usuario_id
        }),
        headers: {'token': token, 'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      Bovino dadosJson = new Bovino.fromJson(json.decode(response.body));
      return dadosJson;
    } else {
      return null;
    }
  }

  Future<List<Bovino>> bovinos(String token) async {
    http.Response response = await http.get(BASE_URL + 'Bovino',
        headers: {'token': token, 'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      List<Bovino> bovinos = json.decode(response.body).map<Bovino>((map) {
        return Bovino.fromJson(map);
      }).toList();
      return bovinos;
    } else {
      return null;
    }
  }

  Future<Bovino> atualizarBovino(
      Bovino bovino, int usuario_id, String token) async {
    http.Response response = await http.put(BASE_URL + "Bovino/" + bovino.id,
        body: jsonEncode({
          "raca_id": bovino.raca_id,
          "brinco": bovino.brinco,
          "nome": bovino.nome,
          "nascimento": bovino.nascimento,
          "peso": bovino.peso,
          "usuario_id": usuario_id
        }),
        headers: {'token': token, 'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      //print(response.body);
      return new Bovino.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<bool> deletarBovino(String codigoBovino, String token) async {
    http.Response response = await http.delete(
        BASE_URL + "Bovino/" + codigoBovino,
        headers: {'token': token, 'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}