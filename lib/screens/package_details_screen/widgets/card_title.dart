import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  final String title;
  const CardTitle({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }
}
