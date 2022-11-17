import 'package:cloud_firestore/cloud_firestore.dart';
import '../entities/find_report.dart';
import '../entities/seek_report.dart';

Future<void> submitFinding({
  required SeekReport seekReport,
  required FindReport findReport,
}) async {
  // new status
  const String newStatus = "success";

  // update seek report
  CollectionReference seekReports = FirebaseFirestore.instance.collection(
    "seek_reports",
  );
  await seekReports.doc(seekReport.id).update(
    {
      "status": newStatus,
    },
  );

  // update find report
  CollectionReference findReports = FirebaseFirestore.instance.collection(
    "find_reports",
  );
  await findReports.doc(findReport.id).update(
    {
      "status": newStatus,
    },
  );
}
