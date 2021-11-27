import 'package:flarax/app/app_widget.dart';
import 'package:flarax/app/core/utils/auth_helper.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitialization;
  runApp(AppWidget());
}
