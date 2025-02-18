import 'package:flutter/material.dart';
import 'package:marketi/app.dart';
import 'package:marketi/core/di/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const App());
}
