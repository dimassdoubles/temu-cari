import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:temu_cari/data/data_sources/seek_report_data_source/remote_data_source.dart';
import 'package:temu_cari/data/repositories/seek_report_repository_impl.dart';
import 'package:temu_cari/domain/entities/seek_report.dart';
import 'package:temu_cari/shared/errors/exceptions.dart';
import 'package:temu_cari/shared/errors/failures.dart';

class MockRemoteSeekReportDataSource extends Mock
    implements SeekReportRemoteDataSource {}

void main() {
  late MockRemoteSeekReportDataSource remoteDataSource;
  late SeekReportRepositoryImpl repository;

  setUp(
    () {
      remoteDataSource = MockRemoteSeekReportDataSource();
      repository = SeekReportRepositoryImpl(remoteDataSource: remoteDataSource);
    },
  );

  test("should return Failure when error", () async {
    when(
      () => remoteDataSource.getReport(),
    ).thenThrow(
      FirebaseGetReportException(),
    );

    final result = await repository.getReport();
    expect(result, Left(FirebaseFailure()));
    verify(() => remoteDataSource.getReport());
    verifyNoMoreInteractions(remoteDataSource);
  });

  List<SeekReport> listReport = [];
  test("should return List<SeekReport> when success", () async {
    when(
      () => remoteDataSource.getReport(),
    ).thenAnswer(
      (invocation) async => listReport,
    );

    final result = await repository.getReport();
    expect(result, Right(listReport));
    verify(() => remoteDataSource.getReport());
    verifyNoMoreInteractions(remoteDataSource);
  });
}
