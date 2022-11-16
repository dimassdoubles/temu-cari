import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temu_cari/presentation/blocs/report_bloc/report_event.dart';
import '../../../domain/entities/find_report.dart';
import '../../../injection_container.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../blocs/auth_bloc/auth_state.dart';
import '../../blocs/report_bloc/report_bloc.dart';
import '../../blocs/report_bloc/report_state.dart';
import '../../../shared/styles/colors.dart';

import '../base_list_item.dart';

class ProcessScreen extends StatelessWidget {
  const ProcessScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reportBloc = getIt<ReportBloc>();
    final authBloc = getIt<AuthBloc>();
    return BlocBuilder(
      bloc: authBloc,
      builder: ((context, authState) {
        if (authState is Authenticated) {
          return BlocBuilder(
            bloc: reportBloc,
            builder: (context, state) {
              if (state is Success) {
                final findReports = state.findReports
                    .where(
                      (element) =>
                          element.author == authState.user.id &&
                          element.status == "process",
                    )
                    .toList();
                final seekReports = state.seekReports
                    .where(
                      (element) =>
                          element.author == authState.user.id &&
                          element.status == "process",
                    )
                    .toList();
                List<dynamic> reports = [
                  ...seekReports,
                  ...findReports,
                ];
                return RefreshIndicator(
                  onRefresh: () async {
                    reportBloc.add(
                      GetReport(
                        authState.user.id,
                      ),
                    );
                  },
                  child: ListView.builder(
                    itemCount: reports.length,
                    itemBuilder: (context, index) {
                      if (reports[index] is FindReport) {
                        return BaseListItem(
                          findReport: reports[index],
                        );
                      }
                      return BaseListItem(
                        seekReport: reports[index],
                      );
                    },
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
        }
        return const SizedBox();
      }),
    );
  }
}
