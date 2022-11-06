import 'package:temu_cari/domain/repositories/user_repository.dart';

class IsSignIn {
  UserRepository repository;
  IsSignIn({required this.repository});

  Future<bool> call() async {
    return await repository.isSignIn();
  }
}
