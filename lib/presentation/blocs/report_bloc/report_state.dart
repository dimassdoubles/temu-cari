import 'package:equatable/equatable.dart';
import '../../../domain/entities/find_report.dart';
import '../../../domain/entities/seek_report.dart';

abstract class ReportState extends Equatable {}

class Loading extends ReportState {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class Success extends ReportState {
  List<FindReport> findReports;
  List<SeekReport> seekReports;
  Success({required this.findReports, required this.seekReports});
  @override
  List<Object?> get props => [findReports, seekReports];
}

class Error extends ReportState {
  @override
  List<Object?> get props => [];
}
