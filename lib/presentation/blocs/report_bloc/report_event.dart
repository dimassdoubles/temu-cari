abstract class ReportEvent {}

class GetReport extends ReportEvent {
  String author;
  GetReport(this.author);
}
