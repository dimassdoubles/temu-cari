import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../injection_container.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../blocs/auth_bloc/auth_state.dart';
import '../../blocs/report_bloc/report_bloc.dart';
import '../../blocs/report_bloc/report_event.dart';
import '../../blocs/report_bloc/report_state.dart';
import 'detail_report_page.dart';

import '../../../shared/routes.dart';
import '../../../shared/styles/colors.dart';
import '../../blocs/auth_bloc/auth_event.dart';

class HomeAdminPage extends StatelessWidget {
  const HomeAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = getIt<AuthBloc>();
    final reportBloc = getIt<ReportBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Pencarian'),
        backgroundColor: purple,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              authBloc.add(LoggedOut());
            },
            icon: const Icon(
              Icons.logout_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: BlocConsumer(
        listener: (context, state) => (state is Authenticated)
            ? null
            : Navigator.pushReplacementNamed(context, loginPage),
        bloc: authBloc,
        builder: (context, authState) {
          if (authState is Authenticated) {
            reportBloc.add(GetReport(authState.user.id));
            return BlocBuilder(
              bloc: reportBloc,
              builder: (context, state) {
                if (state is Success) {
                  final reports = state.seekReports
                      .where(
                        (element) => element.status == "process",
                      )
                      .toList();
                  return RefreshIndicator(
                    color: purple,
                    onRefresh: () async {
                      reportBloc.add(GetReport(authState.user.id));
                    },
                    child: ListView.builder(
                      itemCount: reports.length,
                      itemBuilder: (context, index) => Card(
                        child: ListTile(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SeekReportDetailPage(
                                report: reports[index],
                              ),
                            ),
                          ),
                          title: Text(reports[index].item),
                        ),
                      ),
                    ),
                  );
                } else if (state is Loading) {
                  return Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: purple,
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("Error :("),
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
