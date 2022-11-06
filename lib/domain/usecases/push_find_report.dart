import 'package:dartz/dartz.dart';
import 'package:temu_cari/domain/entities/find_report.dart';
import 'package:temu_cari/domain/repositories/find_report_repository.dart';
import 'package:temu_cari/shared/errors/failures.dart';

class PushFindReport {
  FindReportRepository repository;
  PushFindReport({required this.repository});

  Future<Either<Failure, void>> call(FindReport report) async {
    return await repository.pushReport(report);
  }
}
