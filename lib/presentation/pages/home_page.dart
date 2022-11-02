import 'package:flutter/material.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'Laporan Anda',
              style: TextStyle(
                fontSize: 20,
                fontWeight: bold,
                color: darkGrey,
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Expanded(
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: TabBar(
                      indicatorColor: purple,
                      labelColor: purple,
                      labelStyle: TextStyle(fontWeight: bold),
                      unselectedLabelColor: darkGrey,
                      unselectedLabelStyle: TextStyle(fontWeight: regular),
                      tabs: const [
                        Tab(
                          text: "Submit",
                        ),
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
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        Center(
                          child: Text('Submit'),
                        ),
                        Center(
                          child: Text('Proses'),
                        ),
                        Center(
                          child: Text('Pencocokan'),
                        ),
                        Center(
                          child: Text('Selesai'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: Text(
                'Hello,',
                style: TextStyle(
                  color: lightGrey,
                  fontSize: 24,
                  fontWeight: bold,
                ),
              ),
            ),
            Text(
              'Melody Rindu',
              style: TextStyle(
                color: lightGrey,
                fontSize: 24,
                fontWeight: bold,
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
                    onPressed: () {},
                    child: const Text('Temuan'),
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
                    onPressed: () {},
                    child: Text(
                      'Kehilangan',
                      style: TextStyle(
                        color: orange,
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
