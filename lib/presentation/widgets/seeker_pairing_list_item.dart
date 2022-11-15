// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:temu_cari/domain/entities/find_report.dart';
import 'package:temu_cari/domain/entities/seek_report.dart';

class SeekerPairingListItem extends StatelessWidget {
  SeekReport report;
  FindReport pairReport;
  SeekerPairingListItem({
    required this.report,
    required this.pairReport,
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
        title: Text('Pencarian : ${report.item}'),
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
            Text(report.location),
          ],
        ),
        trailing: IconButton(
          icon: Image.asset('assets/wa-icon.png'),
          onPressed: () {},
        ),
      ),
    );
  }
}
