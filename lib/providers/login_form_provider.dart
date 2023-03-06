import 'package:flutter/material.dart';

class loginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> FormKey = new GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool isLoading = false;
  bool get loading => isLoading;
  set loading(value) {
    isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(FormKey.currentState?.validate() ?? false);
    print('$email - $password');

    return FormKey.currentState?.validate() ?? false;
  }
}
