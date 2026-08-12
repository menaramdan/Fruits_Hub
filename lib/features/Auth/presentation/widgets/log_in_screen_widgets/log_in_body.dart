import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_app/core/routes/app_routes.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/core/utils/app_images.dart';
import 'package:new_app/core/utils/app_text_styles.dart';
import 'package:new_app/core/widgets/custom_button.dart';
import 'package:new_app/core/widgets/custom_text_field.dart';
import 'package:new_app/features/Auth/presentation/Cubit/sign_in_cubit/signin_cubit.dart';
import 'package:new_app/features/Auth/presentation/widgets/log_in_screen_widgets/asking_of_an_account.dart';
import 'package:new_app/features/Auth/presentation/widgets/log_in_screen_widgets/divder_or_widget.dart';
import 'package:new_app/features/Auth/presentation/widgets/log_in_screen_widgets/social_log_in_buttons.dart';
import 'package:new_app/features/Auth/presentation/widgets/sign_up_screen_widgets/password_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInBody extends StatefulWidget {
  const LogInBody({super.key});

  @override
  State<LogInBody> createState() => _LogInBodyState();
}

class _LogInBodyState extends State<LogInBody> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  // ignore: unused_field
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              CustomTextField(
                onSaved: (value) {
                  emailcontroller.text = value ?? ' ';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال البريد الإلكتروني';
                  }
                  return null;
                },
                hinttext: 'البريد الإلكتروني',
                keyboardtype: TextInputType.emailAddress,
                controller: emailcontroller,
              ),
              SizedBox(height: 16),

              PasswordField(passwordcontroller: passwordcontroller),
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
              CustomButton(
                text: 'تسجيل دخول',
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    context.read<SigninCubit>().login(
                      email: emailcontroller.text,
                      password: passwordcontroller.text,
                    );
                  } else {
                    setState(() {
                      _autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
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
                onPressed: () {
                  context.read<SigninCubit>().signInWithGoogle();
                },
                title: 'تسجيل بواسطة جوجل',
                icon: SvgPicture.asset(Assets.googleicon),
              ),
              SizedBox(height: 16),
              
              SocialLogInButtons(
                onPressed: () {
                  context.read<SigninCubit>().signInWithFacebook();
                },
                title: 'تسجيل بواسطة فيسبوك',
                icon: SvgPicture.asset(Assets.facebook),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
