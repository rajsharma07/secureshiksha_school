import 'package:flutter/material.dart';
import 'package:secureshiksha_school/core/http_requests/post_request.dart';
import 'package:secureshiksha_school/model/school_model.dart';

class AttendanceModeProvider extends ChangeNotifier {
  AttendanceMode _attendanceMode;
  AttendanceModeProvider(this._attendanceMode);

  AttendanceMode getAttendanceMode() => _attendanceMode;

  void changeMode(AttendanceMode attendanceMode) async {
    if (_attendanceMode == attendanceMode) return;
    final res = await PostRequest.request(
        "changeAttendanceMode", {"attendanceMode": attendanceMode.name});
    res.fold(
      (l) {
        _attendanceMode = attendanceMode;
        notifyListeners();
      },
      (r) {},
    );
  }
}
