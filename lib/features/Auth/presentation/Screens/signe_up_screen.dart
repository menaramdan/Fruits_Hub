import 'package:flutter/material.dart';
import 'package:new_app/core/helper_function/build_appbar.dart';
import 'package:new_app/features/Auth/presentation/widgets/sign_up_screen_widgets/sign_up_body.dart';

class SigneUpScreen extends StatelessWidget {
  const SigneUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: buildeAppBar(context, title: 'حساب جديد'),
      body: SignUpBody(),
    );
  }
}
