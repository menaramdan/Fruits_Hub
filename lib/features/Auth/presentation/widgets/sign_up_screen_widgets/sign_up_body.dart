import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:new_app/core/routes/app_routes.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/core/widgets/custom_button.dart';
import 'package:new_app/core/widgets/custom_text_field.dart';
import 'package:new_app/features/Auth/presentation/widgets/log_in_screen_widgets/asking_of_an_account.dart';
import 'package:new_app/features/Auth/presentation/widgets/sign_up_screen_widgets/terms_and_conditions.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomTextField(
              hinttext: 'الاسم كامل',
              keyboardtype: TextInputType.name,
            ),
            SizedBox(height: 16),
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
            CheckBox(),
            SizedBox(height: 30),
            CustomButton(text: 'إنشاء حساب', onPressed: () {}),
            SizedBox(height: 30),
            Askingofanaccount(
              text: 'تمتلك حساب بالفعل؟',
              text2: 'قم بتسجيل الدخول',
              recognizer: TapGestureRecognizer()
                ..onTap = () =>
                    Navigator.pushNamed(context, AppRoutes.loginScreen),
            ),
          ],
        ),
      ),
    );
  }
}
