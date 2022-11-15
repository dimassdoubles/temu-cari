import '../entities/find_report.dart';
import '../entities/seek_report.dart';

FindReport searchFindReport({
  required String id,
  required List<FindReport> reports,
}) {
  final result = reports.where((element) => element.id == id).toList();
  for (int i = 0; i < reports.length; i++) {
    if (reports[i].id == id) {
      return reports[i];
    } else {
    }
  }

  return result[0];
}

SeekReport searchSeekReport({
  required String id,
  required List<SeekReport> reports,
}) {
  final result = reports.where((element) => element.id == id).toList();
  for (int i = 0; i < reports.length; i++) {
    if (reports[i].id == id) {
      return reports[i];
    } else {
    }
  }
  return result[0];
}
