import 'package:flutter/material.dart';

import '../finder_pairing_list_item.dart';
import '../seeker_pairing_list_item.dart';

class PairingScreen extends StatelessWidget {
  const PairingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SeekerPairingListItem(),
        FinderPairingListItem(),
      ],
    );
  }
}
