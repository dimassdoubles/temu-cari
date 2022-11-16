// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:temu_cari/domain/entities/seek_report.dart';
import 'package:temu_cari/presentation/pages/admin/find_report_list_page.dart';

class SeekReportDetailPage extends StatelessWidget {
  SeekReportDetailPage({super.key, required this.report});
  SeekReport report;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Laporan Pencarian'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(report.item),
              Text(report.location),
              Text(report.characteristic),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FindReportListPage(
                        seekReport: report,
                      ),
                    ),
                  );
                },
                child: const Text('Cari Pasangan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
