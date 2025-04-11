import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secureshiksha_school/providers/select_screen_provider.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SelectScreenProvider>(
      builder: (context, value, child) => BottomNavigationBar(
        currentIndex: value.selectedScreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_sharp),
            label: "Attendance",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: "Students",
          )
        ],
        onTap: (v) {
          value.change(v);
        },
      ),
    );
  }
}
