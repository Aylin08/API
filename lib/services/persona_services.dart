import 'package:api/models/persona_info.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PersonaServices extends ChangeNotifier {
  final String _url = 'estudiantes-7c28a-default-rtdb.firebaseio.com';
  final List<PersonaInfo> listaAlumno = [];
  bool isLoad = true;
  PersonaServices() {
    cargarInfo();
  }
  Future cargarInfo() async {
    isLoad = true;
    notifyListeners();
    final url = Uri.https(_url, 'Alumnos.json');
    final respuesta = await http.get(url);

    final Map<String, dynamic> mapaAlumnos = json.decode(respuesta.body);
    mapaAlumnos.forEach((key, value) {
      final aux = PersonaInfo.fromMap(value);
      listaAlumno.add(aux);
    });
    isLoad = false;
    notifyListeners();
    return listaAlumno;
  }
}
