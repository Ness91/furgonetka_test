import 'package:flutter/material.dart';

class ModalBottomInfo {
  static void show(BuildContext ctx, String msg) {
    showModalBottomSheet(context: ctx, builder: (c) => ModalBottomSheet(msg));
  }
}

class ModalBottomSheet extends StatelessWidget {
  final String message;

  const ModalBottomSheet(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Text(
        message,
        style: Theme.of(context).textTheme.bodyText1,
        textAlign: TextAlign.center,
      ),
    );
  }
}
