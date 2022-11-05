import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temu_cari/domain/entities/seek_report.dart';

import '../../../shared/errors/exceptions.dart';

abstract class SeekReportRemoteDataSource {
  Future<List<SeekReport>> getReport();
}

class FirebaseSeekReportDataSource extends SeekReportRemoteDataSource {
  static const collectionName = "seek_reports";

  final FirebaseFirestore firestore;

  FirebaseSeekReportDataSource(this.firestore);

  @override
  Future<List<SeekReport>> getReport() async {
    try {
      final result = await firestore.collection(collectionName).get();

      final listReport = result.docs
          .map(
            (e) => SeekReport(
              id: e.id,
              author: e.get("author"),
              location: e.get("location"),
              characteristic: e.get("characteristic"),
              item: e.get("item"),
              pair: e.get("pair"),
              status: e.get("status"),
            ),
          )
          .toList();

      return listReport;
    } catch (error) {
      throw FirebaseGetReportException();
    }
  }
}
