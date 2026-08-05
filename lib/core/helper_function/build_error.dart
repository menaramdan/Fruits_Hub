import 'package:flutter/material.dart';

void builderrors(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('فشل إنشاء الحساب: $errorMessage'),
      backgroundColor: Colors.red,
    ),
  );
}
