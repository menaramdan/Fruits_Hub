import 'package:flutter/material.dart';
import 'package:new_app/core/helper_function/routes.dart';
import 'package:new_app/core/routes/app_routes.dart';

void main() {
  runApp(const FruitsHub());
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruits Hub',
      
    onGenerateRoute: generateRoute,
    initialRoute: AppRoutes.splashScreen,
    debugShowCheckedModeBanner: false,
    );
  }
}