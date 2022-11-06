import 'package:dartz/dartz.dart';
import 'package:temu_cari/domain/entities/seek_report.dart';
import 'package:temu_cari/domain/repositories/seek_report_repository.dart';
import 'package:temu_cari/shared/errors/failures.dart';

class PushSeekReport {
  SeekReportRepository repository;
  PushSeekReport({required this.repository});

  Future<Either<Failure, void>> call(SeekReport report) async {
    return await repository.pushReport(report);
  }
}
