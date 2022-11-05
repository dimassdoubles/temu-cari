import 'package:temu_cari/domain/entities/find_report.dart';
import 'package:dartz/dartz.dart';
import 'package:temu_cari/shared/errors/exceptions.dart';
import 'package:temu_cari/shared/errors/failures.dart';

import '../../domain/repositories/find_report_repository.dart';
import '../data_sources/find_report_data_source/remote_data_source.dart';

class FindReportRepositoryImpl extends FindReportRepository {
  FindReportRemoteDataSource remoteDataSource;

  FindReportRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<FindReport>>> getReport() async {
    try {
      final result = await remoteDataSource.getReport();
      return Right(result);
    } on FirebaseGetReportException {
      return Left(FirebaseFailure());
    }
  }
}
