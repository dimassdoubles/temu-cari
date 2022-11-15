import 'package:dartz/dartz.dart';
import '../entities/seek_report.dart';
import '../repositories/seek_report_repository.dart';

import '../../shared/errors/failures.dart';

class GetSeekReports {
  SeekReportRepository repository;
  GetSeekReports({required this.repository});

  Future<Either<Failure, List<SeekReport>>> call() async {
    return await repository.getReport();
  }
}
