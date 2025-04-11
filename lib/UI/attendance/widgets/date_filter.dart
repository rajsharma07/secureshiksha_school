import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/bloc/attendance/view_attendance/view_attendance_bloc.dart';
import 'package:secureshiksha_school/bloc/attendance/view_attendance/view_attendance_event.dart';
import 'package:secureshiksha_school/bloc/attendance/view_attendance/view_attendance_state.dart';

class DateFilter extends StatefulWidget {
  const DateFilter({super.key});

  @override
  State<DateFilter> createState() => _DateFilterState();
}

class _DateFilterState extends State<DateFilter> {
  DateTime selectedDate = DateTime.now();

  String dateTimeToString(DateTime dt) => "${dt.year}-${dt.month}-${dt.day}";

  Future<void> getDate() async {
    final DateTime? dt = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime.now().subtract(
        const Duration(days: 500),
      ),
    );
    if (dt == null) {
      return;
    } else {
      selectedDate = dt;

      if (context.mounted) {
        context.read<ViewAttendanceBloc>().add(
              GetAttendance(dt),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewAttendanceBloc, ViewAttendanceState>(
      builder: (context, state) {
        return Row(
          children: [
            Text("Date : ${dateTimeToString(selectedDate)}"),
            IconButton(
                onPressed: (state is Loading)
                    ? null
                    : () {
                        getDate();
                      },
                icon: const Icon(Icons.date_range)),
            const Spacer(),
            IconButton(
                onPressed: () {
                  context.read<ViewAttendanceBloc>().add(
                        GetAttendance(selectedDate),
                      );
                },
                icon: const Icon(Icons.replay))
          ],
        );
      },
    );
  }
}
