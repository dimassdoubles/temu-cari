import 'package:temu_cari/data/data_sources/user_data_source.dart/remote_data_source.dart';
import 'package:temu_cari/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:temu_cari/domain/repositories/user_repository.dart';
import 'package:temu_cari/shared/errors/exceptions.dart';
import 'package:temu_cari/shared/errors/failures.dart';

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
