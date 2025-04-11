import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/UI/students/widgets/student_list_tile.dart';
import 'package:secureshiksha_school/bloc/get_students_list/get_students_list_bloc.dart';
import 'package:secureshiksha_school/bloc/get_students_list/get_students_list_state.dart';
import 'package:secureshiksha_school/core/error_widgets/my_snack_bar.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetStudentsListBloc, GetStudentsListState>(
      builder: (context, state) {
        if (state is FailureState) {
          WidgetsBinding.instance.addPostFrameCallback(
            (timeStamp) {
              MySnackBar.showSnackBar(ctx: context, message: state.message);
            },
          );
          return const Text("Error ocurrde while fetching data try again");
        } else if (state is Successful) {
          return (state.studentList.isEmpty)
              ? const Center(
                  child: Text("No data found"),
                )
              : Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                    children: state.studentList.map(
                      (e) {
                        return StudentListTile(
                          student: e,
                        );
                      },
                    ).toList(),
                  )),
                );
        } else if (state is InitialState) {
          return const Center(
            child: Text("Please select standard and division"),
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
