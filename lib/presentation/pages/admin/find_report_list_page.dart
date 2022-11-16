// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temu_cari/domain/entities/seek_report.dart';
import 'package:temu_cari/injection_container.dart';
import 'package:temu_cari/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:temu_cari/presentation/blocs/auth_bloc/auth_state.dart';
import 'package:temu_cari/presentation/blocs/report_bloc/report_bloc.dart';
import 'package:temu_cari/presentation/blocs/report_bloc/report_state.dart';
import 'package:temu_cari/presentation/pages/admin/pairing_page.dart';

import '../../../shared/styles/colors.dart';

class FindReportListPage extends StatelessWidget {
  FindReportListPage({super.key, required this.seekReport});
  SeekReport seekReport;

  @override
  Widget build(BuildContext context) {
    final authBloc = getIt<AuthBloc>();
    final reportBloc = getIt<ReportBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Penemuan'),
        elevation: 0,
      ),
      body: BlocBuilder(
        bloc: authBloc,
        builder: (context, authState) {
          if (authState is Authenticated) {
            return BlocBuilder(
              bloc: reportBloc,
              builder: (context, state) {
                if (state is Success) {
                  final reports = state.findReports
                      .where(
                        (element) =>
                            element.author != seekReport.author &&
                            element.status == "process",
                      )
                      .toList();
                  return ListView.builder(
                    itemCount: reports.length,
                    itemBuilder: (context, index) => Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PairingPage(
                                findReport: reports[index],
                                seekReport: seekReport,
                              ),
                            ),
                          );
                        },
                        title: Text(reports[index].item),
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: purple,
                      ),
                    ),
                  );
                }
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
