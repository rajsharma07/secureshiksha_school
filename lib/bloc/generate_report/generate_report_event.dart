import 'dart:io';

abstract class GenerateReportEvent {}

class GetReportEvent extends GenerateReportEvent {
  final DateTime first;
  final DateTime last;
  GetReportEvent(this.first, this.last);
}

class ShareReportEvent extends GenerateReportEvent {
  final File file;
  ShareReportEvent(this.file);
}
