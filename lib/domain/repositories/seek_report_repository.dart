import 'package:dartz/dartz.dart';
import 'package:temu_cari/domain/entities/seek_report.dart';

import '../../shared/errors/failures.dart';

abstract class SeekReportRepository {
  Future<Either<Failure, List<SeekReport>>> getReport();
}
