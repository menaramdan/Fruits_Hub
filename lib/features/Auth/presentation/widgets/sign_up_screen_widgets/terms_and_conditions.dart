import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/core/utils/app_text_styles.dart';
import 'package:new_app/features/Auth/presentation/widgets/sign_up_screen_widgets/custom_check_box.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<CheckBox> createState() => _CheckBoxState();
}

bool isAgree = false;

class _CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChanged: (bool value) {
            isAgree = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isAgree,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '     من خلال إنشاء حساب ، فإنك توافق على',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.gray400,
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام الخاصة بنا',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.green600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
