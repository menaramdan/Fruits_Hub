import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/core/utils/app_text_styles.dart';
import 'package:new_app/core/widgets/custom_button.dart';
import 'package:new_app/core/widgets/custom_text_field.dart';

class LogInBody extends StatelessWidget {
  const LogInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            CustomTextField(
              hinttext: 'البريد الإلكتروني',
              keyboardtype: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),

            CustomTextField(
              hinttext: 'كلمة المرور',
              keyboardtype: TextInputType.visiblePassword,
              icon: Icon(Icons.remove_red_eye, color: AppColors.coloreye),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'نسيت كلمة المرور؟',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.greencolor1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 33),
            CustomButton(text: 'تسجيل دخول', onPressed: () {}),
            SizedBox(height: 33),
            Text.rich(
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
                    text: 'قم بانشاء حساب',
                    style: TextStyles.semiBold16.copyWith(
                      fontFamily: 'Cairo',
                      color: AppColors.greencolor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
