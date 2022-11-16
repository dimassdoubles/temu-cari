import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import '../../../shared/routes.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/text_styles.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../blocs/auth_bloc/auth_state.dart';
import '../../blocs/report_bloc/report_bloc.dart';
import '../../blocs/report_bloc/report_event.dart';
import '../../widgets/header.dart';
import '../../widgets/screens/pairing_screen.dart';
import '../../widgets/screens/process_screen.dart';
import '../../widgets/screens/success_screen.dart';
import '../../widgets/tab_bar_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authBloc = getIt<AuthBloc>();
  final reportBloc = getIt<ReportBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: authBloc,
      listener: (context, state) => (state is Authenticated)
          ? null
          : Navigator.pushReplacementNamed(context, loginPage),
      builder: (context, state) {
        if (state is Authenticated) {
          reportBloc.add(GetReport(state.user.id));
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Header(),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, homeAdminPage);
                    },
                    child: Text(
                      'Laporan Anda',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: bold,
                        color: darkGrey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Expanded(
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: const [
                        TabBarTitle(),
                        Expanded(
                          child: TabBarView(
                            children: [
                              ProcessScreen(),
                              PairingScreen(),
                              SuccessScreen(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
