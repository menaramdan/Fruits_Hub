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

class LogInBody extends StatefulWidget {
  const LogInBody({super.key});

  @override
  State<LogInBody> createState() => _LogInBodyState();
}

class _LogInBodyState extends State<LogInBody> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            CustomTextField(
              onSaved: (value) {
                controller.text = value ?? ' ';
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'الرجاء إدخال البريد الإلكتروني';
                }
                return null;
              },
              hinttext: 'البريد الإلكتروني',
              keyboardtype: TextInputType.emailAddress,
              controller: controller,
            ),
            SizedBox(height: 16),

            CustomTextField(
              onSaved: (value) {
                controller.text = value ?? ' ';
              },
              controller: controller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'الرجاء إدخال كلمة المرور';
                }
                return null;
              },
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
