import 'package:app_producto/providers/login_form_provider.dart';
import 'package:app_producto/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class registerScreen extends StatelessWidget {
  const registerScreen({super.key});

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
                    'Register',
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
            onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
            child: const Center(
              child: Text(
                'Ya tienes una cuenta?',
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
