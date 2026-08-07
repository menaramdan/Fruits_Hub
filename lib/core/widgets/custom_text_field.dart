import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/core/utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.icon,
    required this.hinttext,
    required this.keyboardtype,
    required this.validator,
    required this.controller,
    required this.onSaved,
    this.obscureText = false,
  });
  final String hinttext;
  final Widget? icon;
  final TextInputType keyboardtype;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      keyboardType: keyboardtype,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyles.bold13.copyWith(color: Color(0xff949D9E)),
        suffixIcon: icon,
        filled: true,
        fillColor: AppColors.colortextform,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: AppColors.colorborder, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: AppColors.colorborder, width: 1),
        ),
      ),
    );
  }
}
