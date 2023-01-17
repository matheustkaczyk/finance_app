import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  String text;

  NotFound(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 200,
          width: 200,
          child: Image.asset(
            'assets/images/zzz.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
