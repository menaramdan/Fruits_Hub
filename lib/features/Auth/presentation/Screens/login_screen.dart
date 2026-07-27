import 'package:flutter/material.dart';
import 'package:new_app/core/helper_function/build_appbar.dart';
import 'package:new_app/features/Auth/presentation/widgets/log_in_screen_widgets/log_in_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildeAppBar(context, title: 'تسجيل دخول'),
      body: LogInBody(),
    );
  }
}
