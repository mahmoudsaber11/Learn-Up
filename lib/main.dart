import 'package:flutter/material.dart';
import 'package:learn_up/learn_up_app.dart';
import 'package:learn_up/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ServiceLocator().setupServiceLocator();
  runApp(const LearnUpApp());
}
