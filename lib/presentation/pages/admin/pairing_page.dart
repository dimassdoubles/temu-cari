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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                'Laporan Kehilangan : \n${seekReport.item}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text("Lokasi Kehilangan: \n${seekReport.location}"),
              const SizedBox(
                height: 16,
              ),
              Text("Ciri-ciri barang: \n${seekReport.characteristic}"),
              const SizedBox(
                height: 16,
              ),
              (findReport.image != "")
                  ? AspectRatio(
                      aspectRatio: 1,
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.network(
                          seekReport.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Laporan Penemuan : \n${findReport.item}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text("Lokasi Penemuan: \n${findReport.location}"),
              const SizedBox(
                height: 16,
              ),
              (findReport.image != "")
                  ? AspectRatio(
                      aspectRatio: 1,
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.network(
                          findReport.image,
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
                  attachReport(seekReport: seekReport, findReport: findReport);
                  Navigator.pushReplacementNamed(context, homeAdminPage);
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
                      child: Text('Pasangkan'),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 64,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
