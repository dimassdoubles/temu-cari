import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class FindReport extends Equatable {
  final String _id, _author, _item, _location, _phone, _pair;
  String status;

  FindReport({
    required String id,
    required String author,
    required String location,
    required String phone,
    required String item,
    String pair = "",
    this.status = "submit",
  })  : _id = id,
        _author = author,
        _item = item,
        _location = location,
        _phone = phone,
        _pair = pair;

  String get phone {
    return _phone;
  }

  String get pair {
    return _pair;
  }

  String get location {
    return _location;
  }

  String get id {
    return _id;
  }

  String get author {
    return _author;
  }

  String get item {
    return _item;
  }

  @override
  List<Object?> get props =>
      [_id, _author, _phone, _location, _item, _pair, status];
}
