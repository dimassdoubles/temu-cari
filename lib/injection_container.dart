import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'data/data_sources/find_report_data_source/remote_data_source.dart';
import 'data/data_sources/seek_report_data_source/remote_data_source.dart';
import 'data/data_sources/user_data_source.dart/remote_data_source.dart';
import 'data/repositories/find_report_repository_impl.dart';
import 'data/repositories/seek_report_repository_impl.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/find_report_repository.dart';
import 'domain/repositories/seek_report_repository.dart';
import 'domain/repositories/sign_out.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/get_find_reports.dart';
import 'domain/usecases/get_seek_reports.dart';
import 'domain/usecases/get_user_logged_in.dart';
import 'domain/usecases/is_sign_in.dart';
import 'domain/usecases/push_find_report.dart';
import 'domain/usecases/push_seek_report.dart';
import 'domain/usecases/sign_in_with_google.dart';
import 'firebase_options.dart';
import 'presentation/blocs/auth_bloc/auth_bloc.dart';
import 'presentation/blocs/report_bloc/report_bloc.dart';

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

  getIt.registerLazySingleton<PushFindReport>(
      () => PushFindReport(repository: getIt()));

  getIt.registerLazySingleton<PushSeekReport>(
    () => PushSeekReport(repository: getIt()),
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

  getIt.registerLazySingleton<GetUserLoggedIn>(
    () => GetUserLoggedIn(repository: getIt()),
  );

  // blocs
  getIt.registerSingleton<AuthBloc>(
    AuthBloc(
      signInWithGoogle: getIt(),
      isSignIn: getIt(),
      signOut: getIt(),
      getUserLoggedIn: getIt(),
    ),
  );

  getIt.registerLazySingleton<ReportBloc>(
    () => ReportBloc(
      getFindReports: getIt(),
      getSeekReports: getIt(),
    ),
  );
}
