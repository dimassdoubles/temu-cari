import 'package:temu_cari/domain/entities/seek_report.dart';
import 'package:dartz/dartz.dart';
import 'package:temu_cari/domain/repositories/seek_report_repository.dart';
import 'package:temu_cari/shared/errors/exceptions.dart';
import 'package:temu_cari/shared/errors/failures.dart';

import '../data_sources/seek_report_data_source/remote_data_source.dart';

class SeekReportRepositoryImpl extends SeekReportRepository {
  SeekReportRemoteDataSource remoteDataSource;

  SeekReportRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<SeekReport>>> getReport() async {
    try {
      final result = await remoteDataSource.getReport();
      return Right(result);
    } on FirebaseGetReportException {
      return Left(FirebaseFailure());
    }
  }

  @override
  Future<Either<Failure, void>> pushReport(SeekReport report) async {
    try {
      await remoteDataSource.pushReport(report);
      return const Right(null);
    } catch (error) {
      return Left(FirebaseFailure());
    }
  }
}
