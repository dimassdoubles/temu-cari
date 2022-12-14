import 'package:dartz/dartz.dart';

import '../../shared/errors/failures.dart';
import '../entities/find_report.dart';
import '../repositories/find_report_repository.dart';

class GetFindReports {
  FindReportRepository repository;
  GetFindReports({required this.repository});

  Future<Either<Failure, List<FindReport>>> call() async {
    return await repository.getReport();
  }
}
