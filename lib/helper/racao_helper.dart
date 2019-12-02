import 'dart:async';
import 'package:sqflite/sqflite.dart';
import '../helper/Databases.dart';

class RacaoHelper {
  static final RacaoHelper _instance = RacaoHelper.internal();

  factory RacaoHelper() => _instance;

  RacaoHelper.internal();
}

class Racao {
  dynamic id;
  String brinco;
  String nome;
  String usuario_id;
  String mediaproducao;
  String racaoDia;


  Racao({this.id, this.brinco, this.nome, this.usuario_id, this.mediaproducao, this.racaoDia});

  factory Racao.fromJson(Map<String, dynamic> json) {
    return Racao(
      id: json['id'],
      brinco: json['brinco'],
      nome: json['nome'],
      usuario_id: json['usuario_id'],
      mediaproducao: json['mediaproducao'],
      racaoDia: json['racaoDia'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brinco'] = this.brinco;
    data['nome'] = this.nome;
    data['usuario_id'] = this.usuario_id;
    data['mediaproducao'] = this.mediaproducao;
    data['racaoDia'] = this.racaoDia;
    return data;
  }

  @override
  String toString() {
    return "Racao(id: $id, brinco: $brinco, nome: $nome, usuario_id: $usuario_id, mediaproducao: $mediaproducao, racaoDia: $racaoDia)";
  }
}
