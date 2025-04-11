import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/bloc/attendance/view_attendance/view_attendance_bloc.dart';
import 'package:secureshiksha_school/bloc/attendance/view_attendance/view_attendance_event.dart';
import 'package:secureshiksha_school/bloc/attendance/view_attendance/view_attendance_state.dart';

class StudentViewAttendanceFilter extends StatefulWidget {
  const StudentViewAttendanceFilter({super.key, required this.rollNumber});
  final String rollNumber;
  @override
  State<StudentViewAttendanceFilter> createState() =>
      _StudentViewAttendanceFilterState();
}

class _StudentViewAttendanceFilterState
    extends State<StudentViewAttendanceFilter> {
  DateTime first = DateTime.now();
  DateTime last = DateTime.now();

  void getFirst() async {
    DateTime? f = await showDatePicker(
        context: context,
        firstDate: DateTime.now().subtract(const Duration(days: 500)),
        lastDate: last);
    if (f != null) {
      setState(() {
        first = f;
      });
    }
  }

  void getLast() async {
    DateTime? f = await showDatePicker(
        context: context,
        firstDate: DateTime.now().subtract(const Duration(days: 500)),
        lastDate: DateTime.now());
    if (f != null) {
      setState(() {
        last = f;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("From: ${first.year}-${first.month}-${first.day}"),
        IconButton(
            onPressed: () {
              getFirst();
            },
            icon: const Icon(Icons.date_range)),
        const Spacer(),
        Text("To: ${last.year}-${last.month}-${last.day}"),
        IconButton(
            onPressed: () {
              getLast();
            },
            icon: const Icon(Icons.date_range)),
        TextButton(
            onPressed: (context.read<ViewAttendanceBloc>().state is Loading)
                ? null
                : () {
                    context.read<ViewAttendanceBloc>().add(
                          GetStudentAttnednace(widget.rollNumber, first, last),
                        );
                  },
            child: const Text("Search"))
      ],
    );
  }
}
