import 'package:flutter/material.dart';

class cardContainer extends StatelessWidget {
  final Widget chill;

  const cardContainer({super.key, required this.chill});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: decorationCard(),
        child: chill,
      ),
    );
  }

  BoxDecoration decorationCard() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 15, offset: Offset(0, 5))
          ]);
}
