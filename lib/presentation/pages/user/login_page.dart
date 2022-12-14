import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../shared/constants/admin.dart';

import '../../../injection_container.dart';
import '../../../shared/routes.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/text_styles.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../blocs/auth_bloc/auth_event.dart';
import '../../blocs/auth_bloc/auth_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = getIt<AuthBloc>();
    return BlocListener(
      bloc: authBloc,
      listener: (context, state) {
        if (state is Authenticated) {
          if (admins.contains(state.user.email)) {
            Navigator.pushReplacementNamed(context, homeAdminPage);
          } else {
            Navigator.pushReplacementNamed(context, homePage);
          }
        }
      },
      child: Scaffold(
        backgroundColor: purple,
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Image.asset('assets/logo.png'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Temu',
                          style: TextStyle(
                            color: lightGrey,
                            fontSize: 24,
                            fontWeight: bold,
                          ),
                        ),
                        Text(
                          'Cari',
                          style: TextStyle(
                            color: orange,
                            fontSize: 24,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Lapor temuan, cari barang hilang',
                    style: TextStyle(
                      color: grey,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      authBloc.add(LoggedIn());
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: orange,
                      elevation: 0,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.google,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Continue With Google',
                              style: TextStyle(
                                fontWeight: bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
