import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/helper_function/build_appbar.dart';
import 'package:new_app/core/services/service_locator.dart';
import 'package:new_app/features/Auth/Domain/Auth_repo.dart';
import 'package:new_app/features/Auth/presentation/Cubit/signup_cubit/signup_cubit.dart';
import 'package:new_app/features/Auth/presentation/widgets/sign_up_screen_widgets/Signup_Bloc_Consumer_Screen.dart';

class SigneUpScreen extends StatelessWidget {
  const SigneUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: buildeAppBar(context, title: 'حساب جديد'),
      body: BlocProvider(
        create: (context) => SignupCubit(getit<AuthRepo>()),
        child: SignupBlocConsumerScreen(),
      ),
    );
  }
}
