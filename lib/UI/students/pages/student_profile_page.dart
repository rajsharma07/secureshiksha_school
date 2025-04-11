import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/UI/students/widgets/student_view_attendance.dart';
import 'package:secureshiksha_school/UI/students/widgets/student_view_attendance_filter.dart';
import 'package:secureshiksha_school/bloc/attendance/view_attendance/view_attendance_bloc.dart';
import 'package:secureshiksha_school/bloc/attendance/view_attendance/view_attendance_state.dart';
import 'package:secureshiksha_school/model/student_model.dart';

class StudentProfilePage extends StatelessWidget {
  const StudentProfilePage({
    super.key,
    required this.student,
  });
  final StudentModel student;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.fullName),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 100,
            child: Icon(
              Icons.person,
              size: 150,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name : ${student.fullName}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Roll number : ${student.rollNumber}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Address : ${student.address}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Email : ${student.email}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          BlocProvider(
            create: (context) => ViewAttendanceBloc(),
            child: Expanded(
              child: Column(
                children: [
                  const Divider(),
                  BlocBuilder<ViewAttendanceBloc, ViewAttendanceState>(
                    builder: (context, state) {
                      return StudentViewAttendanceFilter(
                          rollNumber: student.rollNumber);
                    },
                  ),
                  const StudentViewAttendance(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
