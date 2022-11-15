import 'package:flutter/material.dart';

import 'injection_container.dart';
import 'presentation/blocs/auth_bloc/auth_bloc.dart';
import 'presentation/blocs/auth_bloc/auth_event.dart';
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
    getIt<AuthBloc>().add(AppStart());
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: route.controller,
      initialRoute: route.loginPage,
    );
  }
}
