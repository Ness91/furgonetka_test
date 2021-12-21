import 'package:flutter/material.dart';
import 'package:furgonetka/providers/packages_provider.dart';
import 'package:furgonetka/screens/packages_list_screen/packages_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => PackagesProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Furgonetka',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PackagesListScreen(),
      ),
    );
  }
}
