import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:temu_cari/domain/entities/find_report.dart';
import 'package:temu_cari/domain/repositories/sign_out.dart';
import 'package:temu_cari/domain/usecases/push_find_report.dart';
import 'package:temu_cari/domain/usecases/is_sign_in.dart';
import 'package:temu_cari/domain/usecases/sign_in_with_google.dart';
import '../../domain/entities/seek_report.dart';
import '../../domain/usecases/push_find_report.dart';
import '../../domain/usecases/push_seek_report.dart';
import '../../injection_container.dart';
import '../../shared/routes.dart';
import '../../shared/styles/colors.dart';

import '../../shared/styles/text_styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Navigator.pushReplacementNamed(context, homePage);
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
    );
  }
}
