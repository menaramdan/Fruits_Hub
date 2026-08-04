import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/core/utils/app_images.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });
  final bool isChecked;
  final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
      },
      child: AnimatedContainer(
        width: 24,
        height: 24,
        decoration: ShapeDecoration(
          color: isChecked ? AppColors.green500 : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isChecked ? AppColors.green500 : AppColors.colorborder,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        duration: const Duration(milliseconds: 300),
        child: isChecked
            ? Padding(
                padding: const EdgeInsets.all(3.0),
                child: SvgPicture.asset(Assets.checkedicon),
              )
            : null,
      ),
    );
  }
}
