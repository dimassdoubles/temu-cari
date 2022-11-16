// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:temu_cari/domain/entities/find_report.dart';
import 'package:temu_cari/domain/entities/seek_report.dart';
import 'package:temu_cari/domain/usecases/attach_report.dart';

class PairingPage extends StatelessWidget {
  PairingPage({super.key, required this.findReport, required this.seekReport});
  FindReport findReport;
  SeekReport seekReport;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Pemasangan'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
            ),
            const SafeArea(
              child: Text('Laporan Kehilangan'),
            ),
            Text(seekReport.item),
            Text(seekReport.location),
            Text(seekReport.characteristic),
            const Text('Laporan Penemuan'),
            Text(findReport.item),
            Text(findReport.location),
            ElevatedButton(
              onPressed: () {
                attachReport(seekReport: seekReport, findReport: findReport);
              },
              child: const Text('Pasangkan'),
            ),
          ],
        ),
      ),
    );
  }
}
