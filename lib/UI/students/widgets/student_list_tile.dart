import 'package:flutter/material.dart';
import 'package:secureshiksha_school/UI/students/pages/student_profile_page.dart';
import 'package:secureshiksha_school/model/student_model.dart';

class StudentListTile extends StatelessWidget {
  const StudentListTile({super.key, required this.student});
  final StudentModel student;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(student.fullName),
      subtitle: Text("Roll Number : ${student.rollNumber}"),
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      trailing: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return StudentProfilePage(student: student);
                },
              ),
            );
          },
          icon: const Icon(Icons.arrow_forward_ios)),
    );
  }
}
