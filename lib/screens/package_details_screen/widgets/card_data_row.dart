import 'package:flutter/material.dart';

class CardDataRow extends StatelessWidget {
  final String title;
  final String data;
  const CardDataRow({required this.title, required this.data, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title: ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(data),
      ],
    );
  }
}
