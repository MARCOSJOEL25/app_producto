import 'package:flutter/material.dart';

class authScreen extends StatelessWidget {
  final Widget child;

  const authScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.4,
              child: Stack(
                children: [purpleBox(), const IconHeader()],
              ),
            ),
            child
          ],
        ),
      ),
    );
  }
}

class IconHeader extends StatelessWidget {
  const IconHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: const Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}

class purpleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _boxDecoration(),
      child: Stack(
        children: [
          Positioned(
            top: 90,
            left: 30,
            child: bubble(),
          ),
          Positioned(
            top: -40,
            left: -30,
            child: bubble(),
          ),
          Positioned(
            top: -50,
            right: -20,
            child: bubble(),
          ),
          Positioned(
            bottom: -50,
            left: 10,
            child: bubble(),
          ),
          Positioned(
            bottom: 120,
            right: 30,
            child: bubble(),
          )
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration() => const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1)
      ]));
}

class bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
