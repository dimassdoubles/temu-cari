import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/search_pair_report.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../blocs/auth_bloc/auth_state.dart';
import '../../blocs/report_bloc/report_bloc.dart';
import '../../blocs/report_bloc/report_event.dart';
import '../../blocs/report_bloc/report_state.dart';

import '../../../domain/entities/seek_report.dart';
import '../../../injection_container.dart';
import '../../../shared/styles/colors.dart';
import '../finder_pairing_list_item.dart';
import '../seeker_pairing_list_item.dart';

class PairingScreen extends StatelessWidget {
  const PairingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reportBloc = getIt<ReportBloc>();
    final authBloc = getIt<AuthBloc>();
    return BlocBuilder(
      bloc: authBloc,
      builder: (context, authState) {
        if (authState is Authenticated) {
          return BlocBuilder(
            bloc: reportBloc,
            builder: (context, state) {
              if (state is Success) {
                final pairingFindReports = state.findReports.where(
                  (element) =>
                      element.author == authState.user.id &&
                      element.status == "pairing",
                );
                final pairingSeekReports = state.seekReports.where(
                  (element) =>
                      element.author == authState.user.id &&
                      element.status == "pairing",
                );

                List<dynamic> listReport = [
                  ...pairingSeekReports,
                  ...pairingFindReports,
                ];
                return RefreshIndicator(
                  onRefresh: () async {
                    reportBloc.add(
                      GetReport(
                        authState.user.id,
                      ),
                    );
                  },
                  color: purple,
                  child: ListView.builder(
                      itemCount: listReport.length,
                      itemBuilder: (context, index) {
                        if (listReport[index] is SeekReport) {
                          return SeekerPairingListItem(
                            report: listReport[index],
                            pairReport: searchFindReport(
                              id: listReport[index].pair,
                              reports: state.findReports,
                            ),
                          );
                        }
                        return FinderPairingListItem(
                          report: listReport[index],
                          pairReport: searchSeekReport(
                            id: listReport[index].pair,
                            reports: state.seekReports,
                          ),
                        );
                      }),
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
    );
  }
}
