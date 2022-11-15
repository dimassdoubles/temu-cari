import 'package:equatable/equatable.dart';

class FirebaseUser extends Equatable {
  final String _id;
  final String? _name;

  const FirebaseUser({required String id,  name})
      : _id = id,
        _name = name;

  String get id {
    return _id;
  }

  String? get name {
    return _name;
  }

  @override
  List<Object?> get props => [_id, _name];
}
