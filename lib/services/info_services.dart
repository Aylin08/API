import 'package:api/models/informacion.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class InfoServices extends ChangeNotifier {
  late Informacion data;

  InfoServices() {
    cargarDatos();
  }
  Future cargarDatos() async {
    final Map<dynamic, String> informacionAlumno =
        json.decode("../Json/Informacion.json");
    notifyListeners();
    return informacionAlumno;
  }
}
