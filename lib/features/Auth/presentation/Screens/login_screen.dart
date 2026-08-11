import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/helper_function/build_appbar.dart';
import 'package:new_app/core/helper_function/build_error.dart';
import 'package:new_app/features/Auth/presentation/Cubit/sign_in_cubit/signin_cubit.dart';
import 'package:new_app/features/Auth/presentation/widgets/log_in_screen_widgets/log_in_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildeAppBar(context, title: 'تسجيل دخول'),
      body: BlocConsumer<SigninCubit, SigninState>(
        listener: (context, state) {
          if (state is SigninSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('ت الحساب بنجاح'),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is SigninFailure) {
            debugPrint('❌ Signin Error: ${state.errorMessage}');
            builderrors(context, 'فشل انشاء  الحساب');
          }
        },
        builder: (context, state) {
          return LogInBody();
        },
      ),
    );
  }
}
