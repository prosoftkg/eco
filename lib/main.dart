import 'package:flutter/material.dart';
import 'core/servise_locator/servise_locator.dart';
import 'my_app_material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(MyApp());
}