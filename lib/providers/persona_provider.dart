import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../models/personaInfo.dart';

class PersonaProvider extends ChangeNotifier {
  late PersonaInfo aux;
  PersonaProvider(this.aux);
  impresion() {
    //print(aux.estudianteUno);
  }
}
