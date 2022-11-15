// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:temu_cari/domain/entities/find_report.dart';
import 'package:temu_cari/domain/entities/seek_report.dart';

class BaseListItem extends StatelessWidget {
  FindReport? findReport;
  SeekReport? seekReport;
  BaseListItem({
    this.findReport,
    this.seekReport,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (findReport != null) {
      return FindItem(report: findReport!);
    } else if (seekReport != null) {
      return SeekItem(report: seekReport!);
    } else {
      return const SizedBox();
    }
  }
}

class FindItem extends StatelessWidget {
  FindReport report;
  FindItem({
    required this.report,
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
        title: Text('Penemuan : ${report.item}'),
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
      ),
    );
  }
}

class SeekItem extends StatelessWidget {
  SeekReport report;
  SeekItem({
    required this.report,
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
      ),
    );
  }
}
