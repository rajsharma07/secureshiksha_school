import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/UI/students/widgets/standard_division_filter.dart';
import 'package:secureshiksha_school/UI/students/widgets/student_list.dart';
import 'package:secureshiksha_school/bloc/get_students_list/get_students_list_bloc.dart';

class StudentListPage extends StatelessWidget {
  const StudentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetStudentsListBloc(),
        child: const Column(
          children: [StandardDivisionFilter(), StudentList()],
        ));
  }
}
