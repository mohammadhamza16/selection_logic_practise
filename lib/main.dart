import 'package:flutter/material.dart';
import 'package:selection_logic/screens/root_screen.dart';

void main() {
  runApp(SelectionsApp());
}

class SelectionsApp extends StatelessWidget {
  const SelectionsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Selections Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RootScreen(),
    );
  }
}
