import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/core/utils/app_text_styles.dart';

class DivderOrWidget extends StatelessWidget {
  const DivderOrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.mainBlack20)),
        SizedBox(width: 18),
        Text('أو', style: TextStyles.semiBold16),
        SizedBox(width: 18),
        Expanded(child: Divider(color: AppColors.mainBlack20)),
      ],
    );
  }
}
