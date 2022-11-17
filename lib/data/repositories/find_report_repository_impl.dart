import 'package:dartz/dartz.dart';

import '../../domain/entities/find_report.dart';
import '../../domain/repositories/find_report_repository.dart';
import '../../shared/errors/exceptions.dart';
import '../../shared/errors/failures.dart';
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

  @override
  Future<Either<Failure, void>> pushReport(FindReport report) async {
    try {
      remoteDataSource.pushReport(report);
      return const Right(null);
    } catch (error) {
      return Left(FirebaseFailure());
    }
  }
}
