import 'dart:async';
import 'package:sqflite/sqflite.dart';
import '../helper/Databases.dart';

class InseminaPartosHelper {
  static final InseminaPartosHelper _instance = InseminaPartosHelper.internal();

  factory InseminaPartosHelper() => _instance;

  InseminaPartosHelper.internal();
}

class InseminaPartos {
  String nome;
  String inseminacoes;
  String partos;
  String abortos;
  String total;


  InseminaPartos({this.nome, this.inseminacoes, this.partos, this.abortos, this.total});

  factory InseminaPartos.fromJson(Map<String, dynamic> json) {
    return InseminaPartos(
      nome: json['nome'],
      inseminacoes: json['inseminacoes'],
      partos: json['partos'],
      abortos: json['abortos'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['inseminacoes'] = this.inseminacoes;
    data['partos'] = this.partos;
    data['abortos'] = this.abortos;
    data['total'] = this.total;
    return data;
  }

  @override
  String toString() {
    return "InseminaPartos(nome: $nome, inseminacoes: $inseminacoes, partos: $partos, abortos: $abortos, total: $total)";
  }
}
