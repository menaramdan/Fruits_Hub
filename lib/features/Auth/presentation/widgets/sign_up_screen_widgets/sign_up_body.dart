import 'package:flutter/material.dart';
import 'package:new_app/core/widgets/custom_text_field.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        children: [
          CustomTextField(
            hinttext: 'الاسم كامل',
            keyboardtype: TextInputType.name,
          ),
        ],
      ),
    );
  }
}
