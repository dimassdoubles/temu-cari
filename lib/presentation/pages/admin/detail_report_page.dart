// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:temu_cari/domain/entities/seek_report.dart';
import 'package:temu_cari/presentation/pages/admin/find_report_list_page.dart';
import 'package:temu_cari/shared/styles/colors.dart';

class SeekReportDetailPage extends StatelessWidget {
  SeekReportDetailPage({super.key, required this.report});
  SeekReport report;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Laporan Pencarian'),
        elevation: 0,
        backgroundColor: purple,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Text(
                  report.item,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text("Lokasi Kehilangan: \n${report.location}"),
                const SizedBox(
                  height: 16,
                ),
                Text("Ciri-ciri barang: \n${report.characteristic}"),
                const SizedBox(
                  height: 16,
                ),
                (report.image != "")
                    ? AspectRatio(
                        aspectRatio: 1,
                        child: SizedBox(
                          width: double.infinity,
                          child: Image.network(
                            report.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 32,
                ),
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: purple,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Text('Cari Pasangan'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
