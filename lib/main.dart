import 'package:flutter/material.dart';
import 'package:new_app/features/splash/presentation/screens/splash_screen.dart';

void main() {
  runApp(const FruitsHub());
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruits Hub',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SplashScreen()
    );
  }
}