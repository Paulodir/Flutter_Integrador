import 'dart:async';
import 'package:sqflite/sqflite.dart';
import '../helper/Databases.dart';

class OrdenhaHelper {
  static final OrdenhaHelper _instance = OrdenhaHelper.internal();

  factory OrdenhaHelper() => _instance;

  OrdenhaHelper.internal();

  Databases databases = new Databases();

  Future close() async {
    Database dbOrdenha = await databases.db;
    dbOrdenha.close();
  }
}

class Ordenha {
  dynamic id;
  String bovino_id;
  String leite;
  String descarte;
  String coleta;

  Ordenha({this.id, this.bovino_id, this.leite, this.descarte, this.coleta});

  factory Ordenha.fromJson(Map<String, dynamic> json) {
    return Ordenha(
      id: json['id'],
      bovino_id: json['bovino_id'],
      leite: json['leite'],
      descarte: json['descarte'],
      coleta: json['coleta'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bovino_id'] = this.bovino_id;
    data['leite'] = this.leite;
    data['descarte'] = this.descarte;
    data['coleta'] = this.coleta;
    return data;
  }

  @override
  String toString() {
    return "Ordenha(id: $id, bovino_id: $bovino_id, leite: $leite, descarte: $descarte, coleta: $coleta)";
  }
}
