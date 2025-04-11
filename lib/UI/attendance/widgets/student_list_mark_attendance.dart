import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/UI/attendance/widgets/student_mark_attendance_tile.dart';
import 'package:secureshiksha_school/bloc/get_students_list/get_students_list_bloc.dart';
import 'package:secureshiksha_school/bloc/get_students_list/get_students_list_state.dart';
import 'package:secureshiksha_school/core/error_widgets/my_snack_bar.dart';

class StudentListMarkAttendance extends StatelessWidget {
  const StudentListMarkAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetStudentsListBloc, GetStudentsListState>(
      builder: (context, state) {
        if (state is FailureState) {
          MySnackBar.showSnackBar(ctx: context, message: state.message);
          return const Text("Error ocurrde while fetching data try again");
        } else if (state is Successful) {
          return (state.studentList.isEmpty)
              ? const Center(
                  child: Text("No data found"),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: state.studentList.length,
                    itemBuilder: (context, index) {
                      return StudentMarkAttendanceTile(
                          rollNumber: state.studentList[index].rollNumber,
                          inOut: state.studentList[index].currentStatus);
                    },
                  ),
                );
        } else if (state is InitialState) {
          return const Center(
            child: Text("Select Standart and Division"),
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
