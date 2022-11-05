import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:temu_cari/data/data_sources/seek_report_data_source/remote_data_source.dart';
import 'package:temu_cari/data/repositories/seek_report_repository_impl.dart';
import 'package:temu_cari/domain/repositories/seek_report_repository.dart';
import 'package:temu_cari/domain/usecases/get_seek_reports.dart';

import 'firebase_options.dart';

final getIt = GetIt.instance;

Future<void> injectionSetup() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  getIt.registerLazySingleton<SeekReportRemoteDataSource>(
    () => FirebaseSeekReportDataSource(firestore),
  );
  getIt.registerLazySingleton<SeekReportRepository>(
    () => SeekReportRepositoryImpl(remoteDataSource: getIt()),
  );
  getIt.registerLazySingleton<GetSeekReports>(
    () => GetSeekReports(repository: getIt()),
  );
}
