import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:new_app/core/helper_function/routes.dart';
import 'package:new_app/core/routes/app_routes.dart';
import 'package:new_app/core/generated/l10n.dart';
void main() {
  runApp(const FruitsHub());
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruits Hub',
      localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
      supportedLocales: S.delegate.supportedLocales,
    locale  :const Locale('ar', ''), // Arabic
    onGenerateRoute: generateRoute,
    initialRoute: AppRoutes.splashScreen,
    debugShowCheckedModeBanner: false,
    );
  }
}