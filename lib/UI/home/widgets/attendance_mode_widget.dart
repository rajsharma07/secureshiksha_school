import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secureshiksha_school/model/school_model.dart';
import 'package:secureshiksha_school/providers/attendance_mode_provider.dart';

class AttendanceModeWidget extends StatelessWidget {
  AttendanceModeWidget({super.key, required this.initialAttendanceMode});
  final AttendanceMode initialAttendanceMode;
  final List<AttendanceMode> modes = [
    AttendanceMode.AUTO,
    AttendanceMode.IN,
    AttendanceMode.OUT,
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return AttendanceModeProvider(initialAttendanceMode);
      },
      child: Consumer<AttendanceModeProvider>(
        builder: (context, value, child) {
          AttendanceMode currentMode = value.getAttendanceMode();
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: modes.map(
              (e) {
                return ElevatedButton(
                  onPressed: e.name == currentMode.name
                      ? null
                      : () {
                          value.changeMode(e);
                        },
                  style: ButtonStyle(
                    foregroundColor: const WidgetStatePropertyAll(Colors.white),
                    backgroundColor: WidgetStatePropertyAll(
                      e.name == currentMode.name
                          ? const Color.fromARGB(255, 156, 39, 176)
                          : const Color(0xFF025405),
                    ),
                  ),
                  child: Text(e.name),
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}
