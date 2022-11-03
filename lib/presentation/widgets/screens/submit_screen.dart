import 'package:flutter/material.dart';

import '../submit_list_item.dart';

class SubmitScreen extends StatelessWidget {
  const SubmitScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SubmitListItem(),
        SubmitListItem(),
        SubmitListItem(),
        SubmitListItem(),
        SubmitListItem(),
        SubmitListItem(),
      ],
    );
  }
}
