import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/core/utils/app_text_styles.dart';

class Askingofanaccount extends StatelessWidget {
  const Askingofanaccount({super.key, required this.text, required this.text2});
  final String text;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text,
            style: TextStyles.semiBold16.copyWith(
              fontFamily: 'Cairo',
              color: AppColors.gray400,
            ),
          ),
          TextSpan(
            text: text2,
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
