import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/find_report.dart';
import '../../../domain/entities/seek_report.dart';
import '../../../domain/usecases/get_find_reports.dart';
import '../../../domain/usecases/get_seek_reports.dart';
import 'report_event.dart';
import 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final GetFindReports _getFindReports;
  final GetSeekReports _getSeekReports;
  ReportBloc({
    required GetFindReports getFindReports,
    required GetSeekReports getSeekReports,
  })  : _getFindReports = getFindReports,
        _getSeekReports = getSeekReports,
        super(Loading()) {
    on<GetReport>(
      (event, emit) async {
        List<FindReport> findReports = [];
        List<SeekReport> seekReports = [];
        emit(Loading());
        final getFindReportResult = await _getFindReports();

        getFindReportResult.fold(
          (l) {
            emit(Error());
          },
          (r) {
            findReports = [...r];
          },
        );

        final getSeekReportResult = await _getSeekReports();
        getSeekReportResult.fold(
          (l) {
            emit(Error());
          },
          (r) {
            seekReports = [...r];
          },
        );

        emit(Success(findReports: findReports, seekReports: seekReports));
      },
    );
  }
}
