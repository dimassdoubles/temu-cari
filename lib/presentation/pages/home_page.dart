import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temu_cari/injection_container.dart';
import 'package:temu_cari/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:temu_cari/presentation/blocs/auth_bloc/auth_state.dart';
import 'package:temu_cari/shared/routes.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/text_styles.dart';
import '../widgets/header.dart';
import '../widgets/screens/pairing_screen.dart';
import '../widgets/screens/prosess_screen.dart';
import '../widgets/screens/submit_screen.dart';
import '../widgets/tab_bar_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authBloc = getIt<AuthBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: authBloc,
      listener: (context, state) => (state is Authenticated)
          ? null
          : Navigator.pushReplacementNamed(context, loginPage),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Laporan Anda',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: bold,
                  color: darkGrey,
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Expanded(
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: const [
                    TabBarTitle(),
                    Expanded(
                      child: TabBarView(
                        children: [
                          SubmitScreen(),
                          ProcessScreen(),
                          PairingScreen(),
                          Center(
                            child: Text('Selesai'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
