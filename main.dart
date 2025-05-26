import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(KPACApp());
}

class KPACApp extends StatelessWidget {
  const KPACApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KPAC – Kannada Parent Articulation Companion',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const HomeScreen(),
    );
  }
}
