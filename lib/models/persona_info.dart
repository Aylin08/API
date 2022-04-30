/// To parse this JSON data, do
//
//     final personaInfo = personaInfoFromMap(jsonString);

import 'dart:convert';

class PersonaInfo {
  PersonaInfo({
    required this.carrera,
    required this.email,
    required this.matricula,
    required this.nombre,
    required this.semestre,
    required this.telefono,
  });

  String carrera;
  String email;
  int matricula;
  String nombre;
  String semestre;
  int telefono;

  factory PersonaInfo.fromJson(String str) =>
      PersonaInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PersonaInfo.fromMap(Map<String, dynamic> json) => PersonaInfo(
        carrera: json["carrera"],
        email: json["email"],
        matricula: json["matricula"],
        nombre: json["nombre"],
        semestre: json["semestre"],
        telefono: json["telefono"],
      );

  Map<String, dynamic> toMap() => {
        "carrera": carrera,
        "email": email,
        "matricula": matricula,
        "nombre": nombre,
        "semestre": semestre,
        "telefono": telefono,
      };
}
