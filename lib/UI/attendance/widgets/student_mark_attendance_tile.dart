import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/bloc/attendance/mark_attendance/mark_attendance_bloc.dart';
import 'package:secureshiksha_school/bloc/attendance/mark_attendance/mark_attendance_event.dart';
import 'package:secureshiksha_school/bloc/attendance/mark_attendance/mark_attendance_state.dart';
import 'package:secureshiksha_school/core/error_widgets/my_snack_bar.dart';

class StudentMarkAttendanceTile extends StatelessWidget {
  const StudentMarkAttendanceTile({
    super.key,
    required this.rollNumber,
    required this.inOut,
  });
  final String rollNumber;
  final bool inOut;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MarkAttendanceBloc(rollNumber, inOut),
      child: BlocBuilder<MarkAttendanceBloc, MarkAttendanceState>(
        builder: (context, state) {
          if (state is Successful) {
            return ListTile(
                title: Text(rollNumber),
                trailing: Switch(
                  value: state.inOut,
                  onChanged: (value) {
                    context.read<MarkAttendanceBloc>().add(
                          MarkAttedance(rollNumber, state.inOut),
                        );
                  },
                ));
          } else if (state is InitialState) {
            return ListTile(
              title: Text(rollNumber),
              trailing: Switch(
                value: state.inOut,
                onChanged: (value) {
                  context.read<MarkAttendanceBloc>().add(
                        MarkAttedance(rollNumber, state.inOut),
                      );
                },
              ),
            );
          } else if (state is FailureState) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) {
                MySnackBar.showSnackBar(ctx: context, message: state.message);
              },
            );
            context.read<MarkAttendanceBloc>().add(
                  RollBack(rollNumber),
                );
            return const Text("Failure Occured reloading");
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
