import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_app/core/routes/app_routes.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/core/utils/app_images.dart';
import 'package:new_app/core/utils/app_text_styles.dart';
import 'package:new_app/core/widgets/custom_button.dart';
import 'package:new_app/core/widgets/custom_text_field.dart';
import 'package:new_app/features/Auth/presentation/widgets/log_in_screen_widgets/asking_of_an_account.dart';
import 'package:new_app/features/Auth/presentation/widgets/log_in_screen_widgets/divder_or_widget.dart';
import 'package:new_app/features/Auth/presentation/widgets/log_in_screen_widgets/social_log_in_buttons.dart';

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
            Askingofanaccount(
              text: 'لا تمتلك حساب ؟',
              text2: 'قم بانشاء حساب',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, AppRoutes.signUpScreen);
                },
            ),
            SizedBox(height: 33),
            DivderOrWidget(),
            SizedBox(height: 16),
            SocialLogInButtons(
              onPressed: () {},
              title: 'تسجيل بواسطة جوجل',
              icon: SvgPicture.asset(Assets.googleicon),
            ),
            SizedBox(height: 16),
            SocialLogInButtons(
              onPressed: () {},
              title: 'تسجيل بواسطة أبل',
              icon: SvgPicture.asset(Assets.appleicon),
            ),
            SizedBox(height: 16),
            SocialLogInButtons(
              onPressed: () {},
              title: 'تسجيل بواسطة فيسبوك',
              icon: SvgPicture.asset(Assets.facebook),
            ),
          ],
        ),
      ),
    );
  }
}
