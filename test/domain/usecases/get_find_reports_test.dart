// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:temu_cari/data/repositories/find_report_repository_impl.dart';
// import 'package:temu_cari/domain/entities/find_report.dart';
// import 'package:temu_cari/domain/usecases/get_find_reports.dart';

// class MockFindReportRepository extends Mock
//     implements FindReportRepositoryImpl {}

// void main() {
//   late MockFindReportRepository repository;
//   late GetFindReports usecase;

//   setUp(
//     () {
//       repository = MockFindReportRepository();
//       usecase = GetFindReports(repository: repository);
//     },
//   );

//   List<FindReport> listReport = [];

//   test(
//     "should call repository getReport",
//     () async {
//       when(() => repository.getReport("")).thenAnswer(
//         (invocation) async => Right(listReport),
//       );

//       final result = await usecase("");

//       expect(result, Right(listReport));
//       verify(() => repository.getReport(""));
//       verifyNoMoreInteractions(repository);
//     },
//   );
// }
