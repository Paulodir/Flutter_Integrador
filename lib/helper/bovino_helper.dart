import 'dart:async';
import 'package:sqflite/sqflite.dart';
import '../helper/Databases.dart';

class BovinoHelper {
  static final BovinoHelper _instance = BovinoHelper.internal();

  factory BovinoHelper() => _instance;

  BovinoHelper.internal();

  Databases databases = new Databases();

  Future close() async {
    Database dbBovino = await databases.db;
    dbBovino.close();
  }
}

class Bovino {
  dynamic id;
  String raca_id;
  String brinco;
  String nome;
  String nascimento;
  String peso;
  dynamic usuario_id;

  Bovino({this.id, this.raca_id, this.brinco, this.nome, this.nascimento, this.peso, this.usuario_id});

  factory Bovino.fromJson(Map<String, dynamic> json) {
    return Bovino(
      id: json['id'],
      raca_id: json['raca_id'],
      brinco: json['brinco'],
      nome: json['nome'],
      nascimento: json['nascimento'],
      peso: json['peso'],
      usuario_id: json['usuario_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['raca_id'] = this.raca_id;
    data['brinco'] = this.brinco;
    data['nome'] = this.nome;
    data['nascimento'] = this.nascimento;
    data['peso'] = this.peso;
    return data;
  }

  @override
  String toString() {
    return "Bovino(id: $id, raca_id: $raca_id, brinco: $brinco, nome: $nome, nascimento: $nascimento, peso: $peso, usuario_id: $usuario_id)";
  }
}
