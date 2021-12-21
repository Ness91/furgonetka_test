import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  final List<Widget> children;
  const DataCard({required this.children, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
