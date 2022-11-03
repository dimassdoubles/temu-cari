import 'package:flutter/material.dart';

import '../base_list_item.dart';

class ProcessScreen extends StatelessWidget {
  const ProcessScreen({
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
