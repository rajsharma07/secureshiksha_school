import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/bloc/get_students_list/get_students_list_bloc.dart';
import 'package:secureshiksha_school/bloc/get_students_list/get_students_list_event.dart';
import 'package:secureshiksha_school/bloc/get_students_list/get_students_list_state.dart';
import 'package:secureshiksha_school/core/error_widgets/my_snack_bar.dart';

class StandardDivisionFilter extends StatefulWidget {
  const StandardDivisionFilter({super.key});

  @override
  State<StandardDivisionFilter> createState() => _StandardDivisionFilterState();
}

class _StandardDivisionFilterState extends State<StandardDivisionFilter> {
  final List<String> standards = [
    "Nursery",
    "Sr. KG",
    "Jr. KG",
    ...List.generate(
      12,
      (index) {
        return (index + 1).toString();
      },
    )
  ];
  final List<String> division = ['A', 'B', 'C', 'D', 'E'];
  String? std;
  String? div;

  String getStdDiv(String st, String d) =>
      "${st == "Nursery" ? "0N" : st == "Sr. KG" ? "0S" : st == "Jr. KG" ? "0J" : st.length == 2 ? st : "0$st"}$d";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetStudentsListBloc, GetStudentsListState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Standard
            DropdownButton<String>(
              value: std,
              items: standards.map(
                (e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  );
                },
              ).toList(),
              onChanged: (value) {
                setState(() {
                  std = value;
                });
              },
              hint: const Text("Standard"),
            ),
            //Division
            DropdownButton<String>(
              value: div,
              items: division.map(
                (e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  );
                },
              ).toList(),
              onChanged: (value) {
                setState(() {
                  div = value;
                });
              },
              hint: const Text("Division"),
            ),
            ElevatedButton(
              onPressed: (state is Loading)
                  ? null
                  : () {
                      if (std != null || div != null) {
                        context.read<GetStudentsListBloc>().add(
                              GetStudentsList(
                                getStdDiv(std!, div!),
                              ),
                            );
                      } else {
                        MySnackBar.showSnackBar(
                          ctx: context,
                          message: "Please select standard and division",
                        );
                      }
                    },
              child: const Text("Search"),
            )
          ],
        );
      },
    );
  }
}
