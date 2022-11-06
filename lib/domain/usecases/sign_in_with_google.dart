import 'package:dartz/dartz.dart';
import 'package:temu_cari/domain/entities/user.dart';
import 'package:temu_cari/domain/repositories/user_repository.dart';
import 'package:temu_cari/shared/errors/failures.dart';

class SignInWithGoogle {
  UserRepository repository;
  SignInWithGoogle({required this.repository});

  Future<Either<Failure, FirebaseUser>> call() async {
    await repository.signInWithGoogle();
    return await repository.getUser();
  }
}
