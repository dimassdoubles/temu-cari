import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temu_cari/domain/entities/find_report.dart';

import '../../../shared/errors/exceptions.dart';

abstract class FindReportRemoteDataSource {
  Future<List<FindReport>> getReport();
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
            ),
          )
          .toList();

      return listReport;
    } catch (error) {
      throw FirebaseGetReportException();
    }
  }
}
