import 'package:dartz/dartz.dart';
import '../entities/seek_report.dart';

import '../../shared/errors/failures.dart';

abstract class SeekReportRepository {
  Future<Either<Failure, List<SeekReport>>> getReport();
  Future<Either<Failure, void>> pushReport(SeekReport report);
}
