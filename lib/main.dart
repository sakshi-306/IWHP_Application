import 'package:flutter/material.dart';
import 'screens/input_form_screen.dart';

void main() {
  runApp(BalanceMeApp());
}

class BalanceMeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BalanceMe',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: InputFormScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
