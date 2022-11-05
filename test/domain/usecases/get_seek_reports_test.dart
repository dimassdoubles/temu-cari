import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:temu_cari/domain/entities/seek_report.dart';
import 'package:temu_cari/domain/repositories/seek_report_repository.dart';
import 'package:temu_cari/domain/usecases/get_seek_reports.dart';

class MockSeekReportRepository extends Mock implements SeekReportRepository {}

void main() {
  late MockSeekReportRepository repository;
  late GetSeekReports usecase;

  setUp(
    () {
      repository = MockSeekReportRepository();
      usecase = GetSeekReports(repository: repository);
    },
  );

  List<SeekReport> listSeekReport = [];

  test(
    "should call repository getReport",
    () async {
      when(
        () => repository.getReport(),
      ).thenAnswer(
        (invocation) async => Right(listSeekReport),
      );

      final result = await usecase();

      expect(result, Right(listSeekReport));
      verify(() => repository.getReport());
      verifyNoMoreInteractions(repository);
    },
  );
}
