import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/persona_info.dart';

class PersonaProvider extends ChangeNotifier {
  late PersonaInfo aux;
  PersonaProvider(aux);
  impresion() {
    //print(aux.estudianteUno);
  }
}
