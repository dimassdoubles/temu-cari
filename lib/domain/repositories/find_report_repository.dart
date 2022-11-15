import 'package:dartz/dartz.dart';
import '../entities/find_report.dart';

import '../../shared/errors/failures.dart';

abstract class FindReportRepository {
  Future<Either<Failure, List<FindReport>>> getReport();
  Future<Either<Failure, void>> pushReport(FindReport report);
}
