import 'package:flutter/cupertino.dart';

class DataProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool cargandoDatos() {
    return formKey.currentState?.validate() ?? false;
  }
}
