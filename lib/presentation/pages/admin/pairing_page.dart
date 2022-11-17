// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:temu_cari/domain/entities/find_report.dart';
import 'package:temu_cari/domain/entities/seek_report.dart';
import 'package:temu_cari/domain/usecases/attach_report.dart';
import 'package:temu_cari/shared/routes.dart';
import 'package:temu_cari/shared/styles/colors.dart';

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
        backgroundColor: purple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                'Laporan Kehilangan : ${seekReport.item}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(seekReport.location),
              const SizedBox(
                height: 16,
              ),
              Text(seekReport.characteristic),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Laporan Penemuan : ${findReport.item}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(findReport.location),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () {
                  attachReport(seekReport: seekReport, findReport: findReport);
                  Navigator.pushReplacementNamed(context, homeAdminPage);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: purple,
                  elevation: 0,
                ),
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text('Pasangkan'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
