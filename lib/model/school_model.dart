import 'package:secureshiksha_school/model/esp32_model.dart';

enum AttendanceMode {
  // ignore: constant_identifier_names
  AUTO,
  // ignore: constant_identifier_names
  OUT,
  // ignore: constant_identifier_names
  IN
}

class SchoolModel {
  final String id;
  final String name;
  final String principalName;
  final AttendanceMode attendanceMode;
  final List<Esp32Model> esp32Id;
  final String address;
  SchoolModel({
    required this.id,
    required this.name,
    required this.principalName,
    required this.attendanceMode,
    required this.esp32Id,
    required this.address,
  });

  // fromJson method
  factory SchoolModel.fromJson(
      Map<String, dynamic> json, List<Esp32Model> esp32IdList) {
    return SchoolModel(
      id: json['id'] as String,
      name: json['school_name'] as String,
      principalName: json['principal_name'] as String,
      esp32Id: esp32IdList,
      attendanceMode: AttendanceMode.values[json["attendance_mode"] == "AUTO"
          ? 0
          : json['attendance_mode'] == 'OUT'
              ? 1
              : 2],
      address:
          "${json['address']}, ${json['landmark']}, ${json['district']}, ${json['city']}, ${json['state']}",
    );
  }
}
