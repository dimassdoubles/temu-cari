import 'package:temu_cari/domain/repositories/user_repository.dart';

class SignOut {
  UserRepository repository;
  SignOut({required this.repository});

  call() {
    repository.signOut();
  }
}
