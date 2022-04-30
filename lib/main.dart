import 'package:api/pages/info.dart';
import 'package:api/services/persona_services.dart';
import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Los providers gestionan los servicios
      providers: [
        ChangeNotifierProvider(
          create: (_) => PersonaServices(),
        ),
      ],
      child: const _MyAppState(),
    );
  }
}

class _MyAppState extends StatelessWidget {
  const _MyAppState([Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final informacionAlumno = Provider.of<PersonaServices>(context);
    print(informacionAlumno.aux.estudianteUno);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Alumnos'),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 99, 68, 57),
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/fondo.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            /* child: ListView.builder(
              // ignore: unnecessary_null_comparison
              itemCount: _personas == null ? 0 : _personas.length,
              itemBuilder: (BuildContext context, int index) {
               
                return ListTile(
                  onLongPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Info(
                              matricula: mat,
                              nombre: nom,
                              carrera: car,
                              semestre: sem,
                              telefono: telefono,
                              email: email)),
                    );
                  },
                  title: Text(nom + ' ' + car),
                  subtitle: Text(telefono),
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 99, 68, 57),
                    child: Text(nom.substring(0, 1)),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                );
              },
            ),*/
          )),
    );
  }
}

class Persona {
  String matricula;
  String name;
  String carrera;
  String semestre;
  String telefono;
  String email;

  Persona(this.matricula, this.name, this.carrera, this.semestre, this.telefono,
      this.email);
}
