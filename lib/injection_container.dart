import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:temu_cari/data/data_sources/find_report_data_source/remote_data_source.dart';
import 'package:temu_cari/data/data_sources/seek_report_data_source/remote_data_source.dart';
import 'package:temu_cari/data/data_sources/user_data_source.dart/remote_data_source.dart';
import 'package:temu_cari/data/repositories/find_report_repository_impl.dart';
import 'package:temu_cari/data/repositories/seek_report_repository_impl.dart';
import 'package:temu_cari/data/repositories/user_repository_impl.dart';
import 'package:temu_cari/domain/repositories/find_report_repository.dart';
import 'package:temu_cari/domain/repositories/seek_report_repository.dart';
import 'package:temu_cari/domain/repositories/sign_out.dart';
import 'package:temu_cari/domain/repositories/user_repository.dart';
import 'package:temu_cari/domain/usecases/get_find_reports.dart';
import 'package:temu_cari/domain/usecases/get_seek_reports.dart';
import 'package:temu_cari/domain/usecases/is_sign_in.dart';
import 'package:temu_cari/domain/usecases/sign_in_with_google.dart';

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

  getIt.registerLazySingleton<FindReportRemoteDataSource>(
    () => FirebaseFindReportDataSource(firestore),
  );

  getIt.registerLazySingleton<FindReportRepository>(
    () => FindReportRepositoryImpl(remoteDataSource: getIt()),
  );

  getIt.registerLazySingleton<GetFindReports>(
    () => GetFindReports(repository: getIt()),
  );

  // login
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ["email"],
  );

  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => FirebaseUserDataSource(
      firebaseAuth: firebaseAuth,
      googleSignIn: googleSignIn,
    ),
  );

  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(getIt()),
  );

  getIt.registerLazySingleton<SignInWithGoogle>(
    () => SignInWithGoogle(repository: getIt()),
  );

  getIt.registerLazySingleton<IsSignIn>(
    () => IsSignIn(repository: getIt()),
  );

  getIt.registerLazySingleton<SignOut>(
    () => SignOut(repository: getIt()),
  );
}
