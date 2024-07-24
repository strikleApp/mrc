import 'dart:convert';

import 'package:milk_calculator/screen/loading_screen.dart';
import 'package:milk_calculator/shared_preferences_keys.dart';

class Records {
  static Map<String, Records> mapOfRecords = {};
  String id;
  int litre;
  int millilitre;

  Records({
    required this.id,
    this.litre = 0,
    this.millilitre = 0,
  });

  void setLitre(int litre) {
    this.litre = litre;
  }

  void setMillilitre(int millilitre) {
    this.millilitre = millilitre;
  }

  double getTotalMillilitre() {
    double l = double.parse(litre.toString());
    double total = ((l * 1000) + double.parse(millilitre.toString()));
    return total;
  }

  double getTotalRate(double rate) {
    return rate * (getTotalMillilitre() / 1000);
  }

  static void addInMap({required String key, required Records record}) {
    mapOfRecords[key] = record;
    LoadingScreen.preferences!.setString(
        kRecords,
        jsonEncode(
            mapOfRecords.map((key, record) => MapEntry(key, record.toJson()))));
  }

  static String getTotalLiter(String id) {
    Records? records = mapOfRecords[id];
    if (records == null) {
      return "0";
    } else {
      double totalMilliliter = records.getTotalMillilitre();
      return (totalMilliliter / 1000).toString();
    }
  }

  static int getLitre({required String id}) {
    Records? rec = mapOfRecords[id];
    if (rec == null) {
      return 0;
    } else {
      return rec.litre;
    }
  }

  static int getMillilitre({required String id}) {
    Records? rec = mapOfRecords[id];
    if (rec == null) {
      return 0;
    } else {
      return rec.millilitre;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'litre': litre,
      'millilitre': millilitre,
    };
  }

  factory Records.fromJson(Map<String, dynamic> json) {
    return Records(
      litre: json['litre'],
      millilitre: json['millilitre'],
      id: json['id'],
    );
  }
}
