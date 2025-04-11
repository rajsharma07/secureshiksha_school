import 'dart:io';

abstract class GenerateReportState {}

class FetchingData extends GenerateReportState {}

class GeneratingReport extends GenerateReportState {}

class InitialState extends GenerateReportState {}

class FailureState extends GenerateReportState {
  final String? message;
  FailureState(this.message);
}

class SuccessState extends GenerateReportState {
  final File file;
  SuccessState(this.file);
}
