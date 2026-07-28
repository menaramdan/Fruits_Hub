import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/core/utils/app_text_styles.dart';

class SocialLogInButtons extends StatelessWidget {
  const SocialLogInButtons({
    super.key,
    required this.onPressed,
    required this.title,
    required this.icon,
  });
  final void Function() onPressed;
  final String title;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColors.mainBlack20),
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),

        onPressed: onPressed,
        child: ListTile(
          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
          leading: icon,
          title: Text(
            title,
            style: TextStyles.semiBold16.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
