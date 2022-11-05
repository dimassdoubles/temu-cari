import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SeekReport extends Equatable {
  final String _id, _author, _item, _location, _characteristic, _pair;
  String status;

  SeekReport({
    required String id,
    required String author,
    required String location,
    required String characteristic,
    required String item,
    String pair = "",
    this.status = "submit",
  })  : _id = id,
        _author = author,
        _item = item,
        _location = location,
        _characteristic = characteristic,
        _pair = pair;

  String get characteristic {
    return _characteristic;
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
      [_id, _author, _characteristic, _location, _item, _pair, status];
}
