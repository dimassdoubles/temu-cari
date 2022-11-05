import 'package:flutter/material.dart';
import 'package:temu_cari/injection_container.dart';

import 'shared/routes.dart' as route;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectionSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: route.controller,
      initialRoute: route.loginPage,
    );
  }
}
