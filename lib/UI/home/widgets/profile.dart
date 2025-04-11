import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/UI/home/widgets/attendance_mode_widget.dart';
import 'package:secureshiksha_school/bloc/home/profile/profile_bloc.dart';
import 'package:secureshiksha_school/bloc/home/profile/profile_event.dart';
import 'package:secureshiksha_school/bloc/home/profile/profile_state.dart';
import 'package:secureshiksha_school/core/utils/get_date_from_date_time.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()
        ..add(
          GetProfile(),
        ),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is Loading) {
            return const CircularProgressIndicator();
          } else if (state is Successful) {
            return SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name : ${state.schoolModel.name}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Principal : ${state.schoolModel.principalName}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Address : ${state.schoolModel.address}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Table(
                    border: TableBorder.all(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.black),
                    children: [
                      const TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "Module ID",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "Date of Issue",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ...state.schoolModel.esp32Id.map(
                        (e) {
                          return TableRow(children: [
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(e.id),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  getDateFromDateTime(e.dateOfIssue),
                                ),
                              ),
                            ),
                          ]);
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 30,
                    child: AttendanceModeWidget(
                      initialAttendanceMode: state.schoolModel.attendanceMode,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: TextButton(
                onPressed: () {
                  context.read<ProfileBloc>().add(GetProfile());
                },
                child:
                    const Text("Error While Fetching data Click here to retry"),
              ),
            );
          }
        },
      ),
    );
  }
}
