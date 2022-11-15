import 'package:dartz/dartz.dart';
import '../entities/seek_report.dart';
import '../repositories/seek_report_repository.dart';
import '../../shared/errors/failures.dart';

class PushSeekReport {
  SeekReportRepository repository;
  PushSeekReport({required this.repository});

  Future<Either<Failure, void>> call(SeekReport report) async {
    return await repository.pushReport(report);
  }
}
