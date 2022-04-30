// To parse this JSON data, do
//
//     final PersonaInfo = PersonaInfoFromMap(jsonString);

import 'dart:convert';

class PersonaInfo {
  PersonaInfo({
    required this.estudianteDos,
    required this.estudianteTres,
    required this.estudianteUno,
  });

  Estudiante estudianteDos;
  Estudiante estudianteTres;
  Estudiante estudianteUno;

  factory PersonaInfo.fromJson(String str) =>
      PersonaInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PersonaInfo.fromMap(Map<String, dynamic> json) => PersonaInfo(
        estudianteDos: Estudiante.fromMap(json["EstudianteDos"]),
        estudianteTres: Estudiante.fromMap(json["EstudianteTres"]),
        estudianteUno: Estudiante.fromMap(json["EstudianteUno"]),
      );

  Map<String, dynamic> toMap() => {
        "EstudianteDos": estudianteDos.toMap(),
        "EstudianteTres": estudianteTres.toMap(),
        "EstudianteUno": estudianteUno.toMap(),
      };
}

class Estudiante {
  Estudiante({
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

  factory Estudiante.fromJson(String str) =>
      Estudiante.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Estudiante.fromMap(Map<String, dynamic> json) => Estudiante(
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
