import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/helper_function/build_error.dart';
import 'package:new_app/core/routes/app_routes.dart';
import 'package:new_app/core/widgets/custom_button.dart';
import 'package:new_app/core/widgets/custom_text_field.dart';
import 'package:new_app/features/Auth/presentation/Cubit/sign_in_cubit/signin_cubit.dart';
import 'package:new_app/features/Auth/presentation/widgets/log_in_screen_widgets/asking_of_an_account.dart';
import 'package:new_app/features/Auth/presentation/widgets/sign_up_screen_widgets/password_field.dart';
import 'package:new_app/features/Auth/presentation/widgets/sign_up_screen_widgets/terms_and_conditions.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  bool isternismated = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Form(
          autovalidateMode: _autovalidateMode,
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextField(
                controller: usernamecontroller,
                onSaved: (value) {
                  usernamecontroller.text = value ?? ' ';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال الاسم الكامل';
                  }
                  return null;
                },
                hinttext: 'الاسم كامل',
                keyboardtype: TextInputType.name,
              ),
              SizedBox(height: 16),
              CustomTextField(
                onSaved: (value) {
                  emailcontroller.text = value ?? ' ';
                },
                controller: emailcontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال البريد الإلكتروني';
                  }
                  if (!value.contains("@") || !value.contains(".")) {
                    return "من فضلك أدخل بريدًا إلكترونيًا صحيحًا";
                  }
                  return null;
                },
                hinttext: 'البريد الإلكتروني',
                keyboardtype: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              PasswordField(passwordcontroller: passwordcontroller),

              SizedBox(height: 16),
              CheckBox(
                onChanged: (value) {
                  isternismated = value;
                },
              ),
              SizedBox(height: 30),
              BlocBuilder<SigninCubit, SignupState>(
                builder: (context, state) {
                  return CustomButton(
                    text: 'إنشاء حساب',
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        if (isternismated) {
                          context.read<SigninCubit>().signup(
                            email: emailcontroller.text,
                            password: passwordcontroller.text,
                            username: usernamecontroller.text,
                          );
                        } else {
                          builderrors(
                            context,
                            'الرجاء الموافقة على الشروط والأحكام',
                          );
                        }
                      } else {
                        setState(() {
                          _autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                    child: state is SignupLoading
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : null,
                  );
                },
              ),
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
      ),
    );
  }
}
