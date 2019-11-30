import 'dart:async';
import 'package:sqflite/sqflite.dart';
import '../helper/Databases.dart';

class InseminacaoHelper {
  static final InseminacaoHelper _instance = InseminacaoHelper.internal();
  factory InseminacaoHelper() => _instance;
  InseminacaoHelper.internal();
  Databases databases = new Databases();

  Future close() async {
    Database dbInseminacao = await databases.db;
    dbInseminacao.close();
  }
}

class Inseminacao {
  dynamic id;
  String bovino_id;
  String raca_id;
  String data;
  String secagem;
  String pre_parto;
  String previsao;
  String nomeBovino;

  Inseminacao(
      {this.id,
      this.bovino_id,
      this.raca_id,
      this.data,
      this.secagem,
      this.pre_parto,
      this.previsao,
      this.nomeBovino});

  factory Inseminacao.fromJson(Map<String, dynamic> json) {
    return Inseminacao(
      id: json['id'],
      bovino_id: json['bovino_id'],
      raca_id: json['raca_id'],
      data: json['data'],
      secagem: json['secagem'],
      pre_parto: json['pre_parto'],
      previsao: json['previsao'],
      nomeBovino: json['nomeBovino'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bovino_id'] = this.bovino_id;
    data['raca_id'] = this.raca_id;
    data['data'] = this.data;
    data['secagem'] = this.secagem;
    data['pre_parto'] = this.pre_parto;
    data['previsao'] = this.previsao;
    data['nomeBovino'] = this.nomeBovino;
    return data;
  }

  @override
  String toString() {
    return "Inseminacao(id: $id, bovino_id: $bovino_id, raca_id: $raca_id, data: $data, secagem: $secagem, pre_parto: $pre_parto, previsao: $previsao, nomeBovino: $nomeBovino)";
  }
}
