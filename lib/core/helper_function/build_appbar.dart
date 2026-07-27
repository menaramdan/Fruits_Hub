import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_text_styles.dart';

AppBar buildeAppBar(context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: Icon(Icons.arrow_back_ios_new),
    centerTitle: true,
    title: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Text(title, style: TextStyles.bold19),
    ),
  );
}
