import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:temu_cari/injection_container.dart';
import 'package:temu_cari/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:temu_cari/presentation/blocs/auth_bloc/auth_event.dart';
import 'package:temu_cari/presentation/blocs/auth_bloc/auth_state.dart';
import '../../shared/routes.dart';
import '../../shared/styles/colors.dart';

import '../../shared/styles/text_styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = getIt<AuthBloc>();
    return BlocListener(
      bloc: authBloc,
      listener: (context, state) => (state is Authenticated)
          ? Navigator.pushReplacementNamed(context, homePage)
          : null,
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
