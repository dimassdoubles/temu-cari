import '../data_sources/user_data_source.dart/remote_data_source.dart';
import '../../domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/user_repository.dart';
import '../../shared/errors/exceptions.dart';
import '../../shared/errors/failures.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, FirebaseUser>> getUser() async {
    try {
      final result = await remoteDataSource.getUser();
      return Right(result);
    } on FirebaseGetUserException {
      return Left(FirebaseGetUserFailure());
    }
  }

  @override
  Future<bool> isSignIn() async {
    try {
      return await remoteDataSource.isSignIn();
    } catch (error) {
      return false;
    }
  }

  @override
  signInWithGoogle() async {
    return await remoteDataSource.signInWithGoogle();
  }

  @override
  signOut() async {
    return await remoteDataSource.singOut();
  }
}
