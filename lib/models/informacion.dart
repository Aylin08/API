// To parse this JSON data, do
//
//     final informacion = informacionFromMap(jsonString);

import 'dart:convert';

class Informacion {
  Informacion({
    required this.alumnoUno,
    required this.alumnoDos,
    required this.alumnoTres,
  });

  Alumno alumnoUno;
  Alumno alumnoDos;
  Alumno alumnoTres;

  factory Informacion.fromJson(String str) =>
      Informacion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Informacion.fromMap(Map<String, dynamic> json) => Informacion(
        alumnoUno: Alumno.fromMap(json["AlumnoUno"]),
        alumnoDos: Alumno.fromMap(json["AlumnoDos"]),
        alumnoTres: Alumno.fromMap(json["AlumnoTres"]),
      );

  Map<String, dynamic> toMap() => {
        "AlumnoUno": alumnoUno.toMap(),
        "AlumnoDos": alumnoDos.toMap(),
        "AlumnoTres": alumnoTres.toMap(),
      };
}

class Alumno {
  Alumno({
    required this.matricula,
    required this.nombre,
    required this.carrera,
    required this.semestre,
    required this.telefono,
    required this.email,
  });

  String matricula;
  String nombre;
  String carrera;
  String semestre;
  String telefono;
  String email;

  factory Alumno.fromJson(String str) => Alumno.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Alumno.fromMap(Map<String, dynamic> json) => Alumno(
        matricula: json["matricula"],
        nombre: json["nombre"],
        carrera: json["carrera"],
        semestre: json["semestre"],
        telefono: json["telefono"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "matricula": matricula,
        "nombre": nombre,
        "carrera": carrera,
        "semestre": semestre,
        "telefono": telefono,
        "email": email,
      };
}
