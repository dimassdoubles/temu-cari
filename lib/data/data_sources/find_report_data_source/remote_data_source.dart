import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temu_cari/domain/entities/find_report.dart';

import '../../../shared/errors/exceptions.dart';

abstract class FindReportRemoteDataSource {
  Future<List<FindReport>> getReport(String author);
  Future<void> pushReport(FindReport report);
}

class FirebaseFindReportDataSource extends FindReportRemoteDataSource {
  static const collectionName = "find_reports";

  final FirebaseFirestore firestore;

  FirebaseFindReportDataSource(this.firestore);

  @override
  Future<List<FindReport>> getReport(String author) async {
    try {
      final query = await firestore
          .collection(collectionName)
          .where("author", isEqualTo: author)
          .get();

      final queryPair = await firestore
          .collection(collectionName)
          .where("pair", isEqualTo: author)
          .get();

      final listReport = query.docs
          .map(
            (e) => FindReport(
              id: e.id,
              author: e.get("author"),
              location: e.get("location"),
              phone: e.get("phone"),
              item: e.get("item"),
              pair: e.get("pair"),
              status: e.get("status"),
            ),
          )
          .toList();

      final listPairReport = queryPair.docs
          .map(
            (e) => FindReport(
              id: e.id,
              author: e.get("author"),
              location: e.get("location"),
              phone: e.get("phone"),
              item: e.get("item"),
              pair: e.get("pair"),
              status: e.get("status"),
            ),
          )
          .toList();
      // final result = [...listReport, ...listPairReport];
      // for (int i = 0; i < result.length; i++) {
      //   print(result[i].item);
      // }
      return [...listReport, ...listPairReport];
    } catch (error) {
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
        },
      );
    }

    batch.commit();
  }
}
