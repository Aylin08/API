import 'package:api/pages/info.dart';
import 'package:api/services/persona_services.dart';
import 'package:flutter/material.dart';

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
    // print(informacionAlumno.listaAlumno[0].matricula);
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
            child: ListView.builder(
              // ignore: unnecessary_null_comparison
              itemCount: informacionAlumno.listaAlumno.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onLongPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Info(
                              matricula: informacionAlumno
                                  .listaAlumno[index].matricula
                                  .toString(),
                              nombre:
                                  informacionAlumno.listaAlumno[index].nombre,
                              carrera:
                                  informacionAlumno.listaAlumno[index].carrera,
                              semestre:
                                  informacionAlumno.listaAlumno[index].semestre,
                              telefono: informacionAlumno
                                  .listaAlumno[index].telefono
                                  .toString(),
                              email:
                                  informacionAlumno.listaAlumno[index].email)),
                    );
                  },
                  title: Text(
                      '${informacionAlumno.listaAlumno[index].nombre} ${informacionAlumno.listaAlumno[index].carrera}'),
                  subtitle: Text(
                      informacionAlumno.listaAlumno[index].telefono.toString()),
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 99, 68, 57),
                    child: Text(informacionAlumno.listaAlumno[index].nombre
                        .toString()
                        .substring(0, 1)),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                );
              },
            ),
          )),
    );
  }
}
