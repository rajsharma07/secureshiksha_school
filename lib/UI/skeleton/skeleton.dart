import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secureshiksha_school/UI/attendance/pages/view_attendance_page.dart';
import 'package:secureshiksha_school/UI/home/pages/home_page.dart';
import 'package:secureshiksha_school/UI/skeleton/widget/my_app_bar.dart';
import 'package:secureshiksha_school/UI/skeleton/widget/my_bottom_navigation_bar.dart';
import 'package:secureshiksha_school/UI/students/pages/student_list_page.dart';
import 'package:secureshiksha_school/providers/select_screen_provider.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({super.key});

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  final List<Widget> screens = [
    const HomePage(),
    const ViewAttendancePage(),
    const StudentListPage()
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectScreenProvider(),
      child: Scaffold(
        appBar: MyAppBar.getAppBar(context),
        body: Consumer<SelectScreenProvider>(
          builder: (context, value, child) {
            return screens[value.selectedScreen];
          },
        ),
        bottomNavigationBar: const MyBottomNavigationBar(),
      ),
    );
  }
}
