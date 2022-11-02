import 'package:flutter/material.dart';
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
                    backgroundColor: orange,
                    elevation: 0,
                  ),
                  child: const Center(
                    child: Text('Login'),
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
