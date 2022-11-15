import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';
import '../../shared/styles/text_styles.dart';

class TabBarTitle extends StatelessWidget {
  const TabBarTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: TabBar(
        isScrollable: true,
        indicatorColor: purple,
        labelColor: purple,
        labelStyle: TextStyle(fontWeight: bold),
        unselectedLabelColor: darkGrey,
        unselectedLabelStyle: TextStyle(fontWeight: regular),
        tabs: const [
          Tab(
            text: "Proses",
          ),
          Tab(
            text: "Pencocokan",
          ),
          Tab(
            text: "Selesai",
          ),
        ],
      ),
    );
  }
}
