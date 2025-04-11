import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/UI/attendance/pages/manual_attendance_page.dart';
import 'package:secureshiksha_school/UI/attendance/widgets/attendance_list.dart';
import 'package:secureshiksha_school/UI/attendance/widgets/date_filter.dart';
import 'package:secureshiksha_school/bloc/attendance/view_attendance/view_attendance_bloc.dart';

class ViewAttendancePage extends StatelessWidget {
  const ViewAttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const ManualAttendancePage();
            },
          ));
        },
        label: const Text("Manual Attendance"),
        icon: const Icon(Icons.touch_app_outlined),
      ),
      body: BlocProvider(
          create: (context) => ViewAttendanceBloc(),
          child: const Column(
            children: [
              DateFilter(),
              AttendanceList(),
            ],
          )),
    );
  }
}
