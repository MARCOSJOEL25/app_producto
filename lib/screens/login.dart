import 'package:app_producto/widget/widget.dart';
import 'package:flutter/material.dart';

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
              children: const [
                 SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text('Login', style: TextStyle(fontSize: 30, fontFamily: AutofillHints.creditCardName), ),
                ),
                SizedBox(
                  height: 30,
                ),

                formularioLogin()
              ],
            ),
          ),
          const SizedBox(
                  height: 30,
                ),
          const Center(
                  child: Text('Crear una cuenta nueva', style: TextStyle(fontSize: 10, fontFamily: AutofillHints.creditCardName), ),
                ),
                
        ],
      ),
    ));
  }
}

class formularioLogin extends StatelessWidget {
  const formularioLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: 
                  BorderSide(
                    color: Colors.deepPurple
                    ,)
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple, width: 2) 
                ),
                hintText: 'john.doe@gmail.com',
                labelText: 'Correo electronico',
                labelStyle: TextStyle(
                  color: Colors.grey
                ),
                prefixIcon: Icon(Icons.alternate_email_sharp, color: Colors.deepPurple,)
              ),
            )
          ],
        ),
      ),
    );
  }
}
