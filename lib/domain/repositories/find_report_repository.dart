import 'package:dartz/dartz.dart';
import 'package:temu_cari/domain/entities/find_report.dart';

import '../../shared/errors/failures.dart';

abstract class FindReportRepository {
  Future<Either<Failure, List<FindReport>>> getReport();
  Future<Either<Failure, void>> addReport(FindReport report);
}
