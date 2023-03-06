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
          const Center(
            child: Text(
              'Crear una cuenta nueva',
              style: TextStyle(
                  fontSize: 10, fontFamily: AutofillHints.creditCardName),
            ),
          ),
        ],
      ),
    ));
  }
}

class formularioLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<loginFormProvider>(context);

    return Container(
      child: Form(
        key: loginForm.FormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.deepPurple,
                )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
                hintText: 'john.doe@gmail.com',
                labelText: 'Correo electronico',
                labelStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(
                  Icons.alternate_email_sharp,
                  color: Colors.deepPurple,
                ),
              ),
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                RegExp regExp = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El valor ingresado no es un correo electronico';
              },
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.deepPurple,
                )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
                hintText: '******',
                labelText: 'Contraseña',
                labelStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(
                  Icons.lock_clock_outlined,
                  color: Colors.deepPurple,
                ),
              ),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return value != '' ? null : 'Introduce una contraseña';
              },
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
                disabledColor: Colors.grey,
                color: Colors.deepPurple,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    loginForm.isLoading ? 'Espere...' : 'Ingresar',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        //Focus.of(context).unfocus();

                        if (!loginForm.isValidForm()) {
                          return;
                        }
                        loginForm.loading = true;

                        await Future.delayed(const Duration(seconds: 2));

                        loginForm.loading = false;
                        Navigator.pushReplacementNamed(context, 'home');
                      })
          ],
        ),
      ),
    );
  }
}
