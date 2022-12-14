import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/find_report.dart';
import '../../../shared/errors/exceptions.dart';

abstract class FindReportRemoteDataSource {
  Future<List<FindReport>> getReport();
  Future<void> pushReport(FindReport report);
}

class FirebaseFindReportDataSource extends FindReportRemoteDataSource {
  static const collectionName = "find_reports";

  final FirebaseFirestore firestore;

  FirebaseFindReportDataSource(this.firestore);

  @override
  Future<List<FindReport>> getReport() async {
    try {
      final result = await firestore.collection(collectionName).get();

      

      final listReport = result.docs
          .map(
            (e) => FindReport(
              id: e.id,
              author: e.get("author"),
              location: e.get("location"),
              phone: e.get("phone"),
              item: e.get("item"),
              pair: e.get("pair"),
              status: e.get("status"),
              image: e.get("image"),
            ),
          )
          .toList();

      return listReport;
    } catch (error) {
      print("di sini: $error");
      throw FirebaseGetReportException();
    }
  }

  @override
  Future<void> pushReport(FindReport report) async {
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
          "phone": report.phone,
          "status": report.status,
          "created": FieldValue.serverTimestamp(),
          "image": report.image,
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
          "phone": report.phone,
          "status": report.status,
          "created": FieldValue.serverTimestamp(),
          "image": report.image,
        },
      );
    }

    batch.commit();
  }
}
