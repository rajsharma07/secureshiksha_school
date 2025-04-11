import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secureshiksha_school/providers/number_of_students_provider.dart';

class NumberOfStudents extends StatefulWidget {
  const NumberOfStudents({super.key});

  @override
  State<NumberOfStudents> createState() => _NumberOfStudentsState();
}

class _NumberOfStudentsState extends State<NumberOfStudents> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NumberOfStudentsProvider(),
      child: Consumer<NumberOfStudentsProvider>(
        builder: (context, value, child) {
          return Row(
            children: [
              Text("Numbre of Students : ${value.getNumberOfStudents()}"),
              const Spacer(),
              IconButton(
                  onPressed: (value.getNumberOfStudents() == -1)
                      ? null
                      : () {
                          value.refreashNumber();
                        },
                  icon: const Icon(Icons.replay))
            ],
          );
        },
      ),
    );
  }
}
