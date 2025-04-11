import 'package:flutter/material.dart';
import 'package:secureshiksha_school/UI/home/widgets/change_password_widget.dart';
import 'package:secureshiksha_school/UI/home/widgets/generate_report_widget.dart';
import 'package:secureshiksha_school/UI/home/widgets/number_of_students.dart';
import 'package:secureshiksha_school/UI/home/widgets/profile.dart';
import 'package:secureshiksha_school/UI/home/widgets/profile_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const ProfileImage(),
            const SizedBox(
              height: 20,
            ),
            const Profile(),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 30,
              child: NumberOfStudents(),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  showBottomSheet(
                    context: context,
                    enableDrag: true,
                    showDragHandle: true,
                    constraints:
                        const BoxConstraints(minHeight: 100, maxHeight: 200),
                    builder: (context) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: ChangePasswordWidget(),
                      );
                    },
                  );
                },
                child: const Text("Change Password")),
            ElevatedButton(
                onPressed: () {
                  showBottomSheet(
                    showDragHandle: true,
                    constraints: const BoxConstraints(maxHeight: 300),
                    context: context,
                    backgroundColor: const Color.fromARGB(255, 222, 241, 228),
                    builder: (context) {
                      return const GenerateReportWidget();
                    },
                  );
                },
                child: const Text("Generate Attendance Report"))
          ],
        ),
      ),
    );
  }
}
