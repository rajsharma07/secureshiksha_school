import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/bloc/attendance/view_attendance/view_attendance_bloc.dart';
import 'package:secureshiksha_school/bloc/attendance/view_attendance/view_attendance_state.dart';
import 'package:secureshiksha_school/core/error_widgets/my_snack_bar.dart';

class StudentViewAttendance extends StatelessWidget {
  const StudentViewAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewAttendanceBloc, ViewAttendanceState>(
      builder: (context, state) {
        if (state is Successful) {
          return (state.attendanceList.isEmpty)
              ? const Center(
                  child: Text("No data found"),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: state.attendanceList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                            state.attendanceList[index].dateTime.toString()),
                        trailing: Icon(
                          state.attendanceList[index].inOut
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                        ),
                      );
                    },
                  ),
                );
        } else if (state is FailureState) {
          WidgetsBinding.instance.addPostFrameCallback(
            (timeStamp) {
              MySnackBar.showSnackBar(ctx: context, message: state.message);
            },
          );
          return const Text("Error occured Try again\n");
        } else if (state is InitialState) {
          return const Center(
            child: Text("Please search attendance record"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
