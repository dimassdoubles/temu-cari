import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temu_cari/domain/entities/find_report.dart';
import 'package:temu_cari/domain/entities/seek_report.dart';

Future<void> attachReport({
  required SeekReport seekReport,
  required FindReport findReport,
}) async {
  // new status
  const String newStatus = "pairing";

  // update seek report
  CollectionReference seekReports = FirebaseFirestore.instance.collection(
    "seek_reports",
  );
  await seekReports.doc(seekReport.id).update(
    {
      "pair": findReport.id,
      "status": newStatus,
    },
  );

  // update find report
  CollectionReference findReports = FirebaseFirestore.instance.collection(
    "find_reports",
  );
  await findReports.doc(findReport.id).update(
    {
      "pair": seekReport.id,
      "status": newStatus,
    },
  );
}
