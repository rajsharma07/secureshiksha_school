import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/UI/report_page/report_page.dart';
import 'package:secureshiksha_school/UI/skeleton/about_page.dart';
import 'package:secureshiksha_school/bloc/login/login_bloc.dart';
import 'package:secureshiksha_school/bloc/login/login_event.dart';

abstract class MyAppBar {
  const MyAppBar();

  static AppBar getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 241, 255, 241),
      title: RichText(
        text: const TextSpan(
          text: "Reg",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: Color(0xFF025405),
          ),
          children: [
            TextSpan(
              text: "Ex",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: Color(0xFF520552),
              ),
            )
          ],
        ),
      ),
      actions: [
        TextButton.icon(
          label: const Text("Report"),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const ReportPage();
                },
              ),
            );
          },
          icon: const Icon(
            Icons.report,
          ),
        ),
        IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const AboutPage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.info)),
        IconButton(
          onPressed: () {
            context.read<LoginBloc>().add(
                  LogOut(),
                );
          },
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }
}
