import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temu_cari/injection_container.dart';
import 'package:temu_cari/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:temu_cari/presentation/blocs/auth_bloc/auth_event.dart';
import 'package:temu_cari/presentation/blocs/auth_bloc/auth_state.dart';
import 'package:temu_cari/shared/routes.dart';

import '../../shared/styles/colors.dart';
import '../../shared/styles/text_styles.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authBloc = getIt<AuthBloc>();
    return Container(
      decoration: BoxDecoration(
        color: purple,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hello,',
                    style: TextStyle(
                      color: lightGrey,
                      fontSize: 24,
                      fontWeight: bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      authBloc.add(LoggedOut());
                    },
                    icon: const Icon(
                      Icons.logout_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder(
              bloc: authBloc,
              builder: (context, state) => (state is Authenticated)
                  ? Text(
                      state.user.name!,
                      style: TextStyle(
                        color: lightGrey,
                        fontSize: 24,
                        fontWeight: bold,
                      ),
                    )
                  : Text(
                      'No Name',
                      style: TextStyle(
                        color: lightGrey,
                        fontSize: 24,
                        fontWeight: bold,
                      ),
                    ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Ingin melaporkan apa hari ini?',
              style: TextStyle(
                color: grey,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, finderFormPage);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text('Temuan'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: lightGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, seekerFormPage);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Kehilangan',
                        style: TextStyle(
                          color: orange,
                        ),
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
