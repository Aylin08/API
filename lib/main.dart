import 'package:api/pages/info.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Persona> _personas = [
    Persona("18760442", "Luisa Aylin Gallegos Cabrera", " I.S.C", "8vo",
        "6462563511", "al18760442@ite.edu.mx"),
    Persona("18760439", "Cristian Castro", "Lic. Música", "9no", "646124567",
        "al18760439@ite.edu.mx"),
    Persona("18760444", "Carlos Pacheco", "I.G.E", "7mo", "6462481177",
        "al18760444@ite.edu.mx"),
  ];
  @override
  Widget build(BuildContext context) {
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
              itemCount: _personas.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onLongPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Info(
                              matricula: _personas[index].matricula,
                              nombre: _personas[index].name,
                              carrera: _personas[index].carrera,
                              semestre: _personas[index].semestre,
                              telefono: _personas[index].telefono,
                              email: _personas[index].email)),
                    );
                    // _borrarPersona(context, _personas[index]);
                  },
                  title: Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      _personas[index].name + ' ' + _personas[index].carrera),
                  subtitle: Text(_personas[index].telefono),
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 99, 68, 57),
                    child: Text(_personas[index].name.substring(0, 1)),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                );
              },
            ),
          )),
    );
  }

  _borrarPersona(context, Persona persona) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("Eliminar"),
              content: const Text("¿Seguro que deseas eliminarlo de la lista?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
                TextButton(
                    onPressed: () {
                      setState(() {
                        _personas.remove(persona);
                      });

                      Navigator.pop(context);
                    },
                    child: const Text("Delete",
                        style: TextStyle(color: Colors.red)))
              ],
            ));
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
