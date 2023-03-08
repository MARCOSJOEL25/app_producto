import 'package:app_producto/providers/login_form_provider.dart';
import 'package:app_producto/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return authScreen(
        child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          cardContainer(
            chill: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 30, fontFamily: AutofillHints.creditCardName),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ChangeNotifierProvider(
                  create: (_) => loginFormProvider(),
                  child: formularioLogin(),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () => Navigator.pushReplacementNamed(context, 'register'),
            child: const Center(
              child: Text(
                'Crear una cuenta nueva',
                style: TextStyle(
                    fontSize: 10, fontFamily: AutofillHints.creditCardName),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

