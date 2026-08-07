import 'package:flutter/material.dart';
import 'package:new_app/core/widgets/custom_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, required this.passwordcontroller});

  final TextEditingController passwordcontroller;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscuretext = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      obscureText: obscuretext,
      onSaved: (value) {
        widget.passwordcontroller.text = value ?? ' ';
      },
      controller: widget.passwordcontroller,
      validator: (value) {
        if (value == null || value.length < 6) {
          return "Password must be at least 6 characters";
        }
        return null;
      },
      hinttext: 'كلمة المرور',
      keyboardtype: TextInputType.visiblePassword,
      icon: GestureDetector(
        onTap: () {
          setState(() {
            obscuretext = !obscuretext;
          });
        },
        child: Icon(
          obscuretext ? Icons.visibility : Icons.visibility_off,
          color: Colors.grey,
        ),
      ),
    );
  }
}
