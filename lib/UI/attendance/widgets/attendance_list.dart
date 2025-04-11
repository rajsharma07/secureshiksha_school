import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/bloc/attendance/view_attendance/view_attendance_bloc.dart';
import 'package:secureshiksha_school/bloc/attendance/view_attendance/view_attendance_event.dart';
import 'package:secureshiksha_school/bloc/attendance/view_attendance/view_attendance_state.dart';
import 'package:secureshiksha_school/core/error_widgets/my_snack_bar.dart';

class AttendanceList extends StatelessWidget {
  const AttendanceList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewAttendanceBloc, ViewAttendanceState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Successful) {
          return Expanded(
            child: state.attendanceList.isEmpty
                ? const Text("No data found")
                : ListView.builder(
                    itemCount: state.attendanceList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          state.attendanceList[index].rollNumber,
                        ),
                        subtitle: Text(
                          state.attendanceList[index].dateTime.toString(),
                        ),
                        trailing: Icon(state.attendanceList[index].inOut
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off),
                      );
                    },
                  ),
          );
        } else if (state is FailureState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            MySnackBar.showSnackBar(
              ctx: context,
              message: state.message,
            );
          });
          return const Text("Failed to Fetch attendance please retry!");
        } else {
          return TextButton(
              onPressed: () {
                context
                    .read<ViewAttendanceBloc>()
                    .add(GetAttendance(DateTime.now()));
              },
              child: const Text("Click Here to Load attendance"));
        }
      },
    );
  }
}
