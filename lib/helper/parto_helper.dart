import 'dart:async';
import 'package:sqflite/sqflite.dart';
import '../helper/Databases.dart';
import 'package:flutter_integrador/utils/Strings.dart';

class PartoHelper {
  static final PartoHelper _instance = PartoHelper.internal();

  factory PartoHelper() => _instance;

  PartoHelper.internal();

  Databases databases = new Databases();

  Future close() async {
    Database dbParto = await databases.db;
    dbParto.close();
  }
}

class Parto {
  dynamic id;
  String bovino_id;
  String data;
  String nascido;
  String nomeBovino;

  Parto({this.id, this.bovino_id, this.data, this.nascido, this.nomeBovino});

  factory Parto.fromJson(Map<String, dynamic> json) {
    return Parto(
      id: json['id'],
      bovino_id: json['bovino_id'],
      data: json['data'],
      nascido: json['nascido'],
      nomeBovino: json['nomeBovino'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bovino_id'] = this.bovino_id;
    data['data'] = this.data;
    data['nomeBovino'] = this.nomeBovino;
    data['nascido'] = this.nascido;
    return data;
  }

  @override
  String toString() {
    return "Parto(id: $id, bovino_id: $bovino_id, data: $data, nomeBovino: $nomeBovino, nascido: $nascido)";
  }
}
