import 'package:flutter/material.dart';

class SignCard extends StatelessWidget {
  final String imagePath;
  final String letter;

  const SignCard({
    Key? key,
    required this.imagePath,
    required this.letter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.yellow[50],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                letter,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
