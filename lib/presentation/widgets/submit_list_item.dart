import 'package:flutter/material.dart';

class SubmitListItem extends StatelessWidget {
  const SubmitListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 32, left: 32, bottom: 16),
      height: 72,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            offset: const Offset(0, 4),
            blurRadius: 5,
          ),
        ],
      ),
      child: ListTile(
        title: const Text('Penemuan : Uang 50k'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/location.png',
              width: 10,
            ),
            const SizedBox(
              width: 4,
            ),
            const Text('Sekitar kantin Fisip'),
          ],
        ),
      ),
    );
  }
}
