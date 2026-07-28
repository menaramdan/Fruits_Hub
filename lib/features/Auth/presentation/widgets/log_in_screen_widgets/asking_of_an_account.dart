import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:new_app/core/routes/app_routes.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/core/utils/app_text_styles.dart';

class Askingofanaccount extends StatelessWidget {
  const Askingofanaccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'لا تمتلك حساب ؟',
            style: TextStyles.semiBold16.copyWith(
              fontFamily: 'Cairo',
              color: AppColors.gray400,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, AppRoutes.signUpScreen);
              },
            text: 'قم بانشاء حساب',
            style: TextStyles.semiBold16.copyWith(
              fontFamily: 'Cairo',
              color: AppColors.greencolor,
            ),
          ),
        ],
      ),
    );
  }
}
