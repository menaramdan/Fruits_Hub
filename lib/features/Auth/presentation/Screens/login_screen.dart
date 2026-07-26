import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_text_styles.dart';
import 'package:new_app/features/Auth/presentation/widgets/log_in_screen_widgets/log_in_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new),
        centerTitle: true,
        title: Text('تسجيل دخول', style: TextStyles.bold19),
      ),
      body: LogInBody(),
    );
  }
}
