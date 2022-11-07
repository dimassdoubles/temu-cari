import 'package:dartz/dartz.dart';
import 'package:temu_cari/domain/entities/find_report.dart';
import 'package:temu_cari/domain/repositories/find_report_repository.dart';

import '../../shared/errors/failures.dart';

class GetFindReports {
  FindReportRepository repository;
  GetFindReports({required this.repository});

  Future<Either<Failure, List<FindReport>>> call(String author) async {
    return await repository.getReport(author);
  }
}
