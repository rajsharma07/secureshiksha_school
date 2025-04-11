class AttendanceModel {
  final String rollNumber;
  final DateTime dateTime;
  final bool inOut;

  AttendanceModel({
    required this.rollNumber,
    required this.dateTime,
    required this.inOut,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      rollNumber: json['roll_number'],
      dateTime: DateTime.parse(json['date_time']),
      inOut: json['in_out'] == 1,
    );
  }
}
