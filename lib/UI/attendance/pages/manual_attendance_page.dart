import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/UI/attendance/widgets/standard_division_filter.dart';
import 'package:secureshiksha_school/UI/attendance/widgets/student_list_mark_attendance.dart';
import 'package:secureshiksha_school/bloc/get_students_list/get_students_list_bloc.dart';

class ManualAttendancePage extends StatelessWidget {
  const ManualAttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manual Attendance"),
      ),
      body: BlocProvider(
          create: (context) => GetStudentsListBloc(),
          child: const Column(
            children: [StandardDivisionFilter(), StudentListMarkAttendance()],
          )),
    );
  }
}
