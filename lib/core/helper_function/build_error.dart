import 'package:flutter/material.dart';

void builderrors(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('   $errorMessage'), backgroundColor: Colors.red),
  );
}
