import 'package:flutter/material.dart';

import '../base_list_item.dart';

class SubmitScreen extends StatelessWidget {
  const SubmitScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        BaseListItem(),
        BaseListItem(),
        BaseListItem(),
        BaseListItem(),
        BaseListItem(),
        BaseListItem(),
      ],
    );
  }
}
