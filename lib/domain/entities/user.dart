import 'package:equatable/equatable.dart';

class FirebaseUser extends Equatable {
  final String _id;
  final String? _name, _email;

  const FirebaseUser({
    required String id,
    name,
     email,
  })  : _id = id,
        _email = email,
        _name = name;

  String? get email {
    return _email;
  }

  String get id {
    return _id;
  }

  String? get name {
    return _name;
  }

  @override
  List<Object?> get props => [_id, _name];
}
