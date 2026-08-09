import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/helper_function/build_error.dart';
import 'package:new_app/features/Auth/presentation/Cubit/signup_cubit/signup_cubit.dart';
import 'package:new_app/features/Auth/presentation/widgets/sign_up_screen_widgets/sign_up_body.dart';

class SignupBlocConsumerScreen extends StatelessWidget {
  const SignupBlocConsumerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تم إنشاء الحساب بنجاح'),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is SignupFailure) {
          builderrors(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return SignUpBody();
      },
    );
  }
}
