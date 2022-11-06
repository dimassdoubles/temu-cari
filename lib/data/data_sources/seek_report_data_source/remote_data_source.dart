import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temu_cari/domain/entities/seek_report.dart';

import '../../../shared/errors/exceptions.dart';

abstract class SeekReportRemoteDataSource {
  Future<List<SeekReport>> getReport();
  Future<void> pushReport(SeekReport report);
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

  @override
  Future<void> pushReport(SeekReport report) async {
    WriteBatch batch = firestore.batch();
    CollectionReference collectionReference =
        firestore.collection(collectionName);

    // push new report
    if (report.id == "") {
      batch.set(
        collectionReference.doc(),
        {
          "author": report.author,
          "item": report.item,
          "location": report.location,
          "pair": report.pair,
          "characteristic": report.characteristic,
          "status": report.status,
          "created": FieldValue.serverTimestamp(),
        },
      );
    }
    // update report
    else {
      batch.set(
        collectionReference.doc(report.id),
        {
          "author": report.author,
          "item": report.item,
          "location": report.location,
          "pair": report.pair,
          "characteristic": report.characteristic,
          "status": report.status,
          "created": FieldValue.serverTimestamp(),
        },
      );
    }

    batch.commit();
  }
}
