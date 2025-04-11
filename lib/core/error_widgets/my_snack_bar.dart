import 'package:flutter/material.dart';

abstract class MySnackBar {
  const MySnackBar();

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      {required ctx, required message}) {
    return ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
