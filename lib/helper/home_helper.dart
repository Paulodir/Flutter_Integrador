import 'dart:async';
import 'package:sqflite/sqflite.dart';
import '../helper/Databases.dart';

class HomeHelper {
  static final HomeHelper _instance = HomeHelper.internal();

  factory HomeHelper() => _instance;

  HomeHelper.internal();
}

class Home {
  dynamic id;
  String nome;
  String ultimoParto;
  String ultimaInseminacao;
  String status;
  dynamic vazia;

  Home({this.id, this.nome, this.ultimoParto, this.ultimaInseminacao, this.status, this.vazia});

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
      id: json['id'],
      nome: json['nome'],
      ultimoParto: json['ultimoParto'],
      ultimaInseminacao: json['ultimaInseminacao'],
      status: json['status'],
      vazia: json['vazia'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['ultimoParto'] = this.ultimoParto;
    data['ultimaInseminacao'] = this.ultimaInseminacao;
    data['status'] = this.status;
    data['vazia'] = this.vazia;
    return data;
  }

  @override
  String toString() {
    return "Home(id: $id, nome: $nome, ultimoParto: $ultimoParto, ultimaInseminacao: $ultimaInseminacao, status: $status, vazia: $vazia)";
  }
}
