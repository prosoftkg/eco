import 'package:flutter/material.dart';
import 'core/servise_locator/servise_locator.dart';
import 'core/utils/utils.dart';
import 'my_app_material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(MyApp());
}