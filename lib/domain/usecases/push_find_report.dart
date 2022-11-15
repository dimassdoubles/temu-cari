import 'package:dartz/dartz.dart';
import '../entities/find_report.dart';
import '../repositories/find_report_repository.dart';
import '../../shared/errors/failures.dart';

class PushFindReport {
  FindReportRepository repository;
  PushFindReport({required this.repository});

  Future<Either<Failure, void>> call(FindReport report) async {
    return await repository.pushReport(report);
  }
}
