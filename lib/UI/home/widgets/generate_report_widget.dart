import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/bloc/generate_report/generate_report_bloc.dart';
import 'package:secureshiksha_school/bloc/generate_report/generate_report_event.dart';
import 'package:secureshiksha_school/bloc/generate_report/generate_report_state.dart';
import 'package:secureshiksha_school/core/error_widgets/my_snack_bar.dart';

class GenerateReportWidget extends StatefulWidget {
  const GenerateReportWidget({super.key});

  @override
  State<GenerateReportWidget> createState() => _GenerateReportWidgetState();
}

class _GenerateReportWidgetState extends State<GenerateReportWidget> {
  DateTime first = DateTime.now();
  DateTime last = DateTime.now().add(const Duration(days: 500));

  void getFirst() async {
    DateTime? f = await showDatePicker(
        context: context,
        firstDate: DateTime.now().subtract(const Duration(days: 500)),
        lastDate: last);
    if (f != null) {
      setState(() {
        first = f;
      });
    }
  }

  void getLast() async {
    DateTime? f = await showDatePicker(
        context: context,
        firstDate: DateTime.now().subtract(const Duration(days: 500)),
        lastDate: DateTime.now().add(const Duration(days: 500)));
    if (f != null) {
      setState(() {
        last = f;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenerateReportBloc(),
      child: BlocBuilder<GenerateReportBloc, GenerateReportState>(
        builder: (context, state) {
          if (state is FailureState) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) {
                MySnackBar.showSnackBar(ctx: context, message: state.message);
              },
            );
          }
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text("From"),
                    IconButton(
                      onPressed: () {
                        getFirst();
                      },
                      icon: const Icon(Icons.date_range),
                    ),
                    const Spacer(),
                    const Text("To:"),
                    IconButton(
                        onPressed: () {
                          getLast();
                        },
                        icon: const Icon(Icons.date_range))
                  ],
                ),
                Row(
                  children: [
                    Text("${first.year}-${first.month}-${first.day}"),
                    const Spacer(),
                    Text("${last.year}-${last.month}-${last.day}")
                  ],
                ),
                if (state is FetchingData) const Text("Fetching data"),
                if (state is GeneratingReport) const Text("Generating report"),
                ElevatedButton(
                  onPressed:
                      (state is FetchingData || state is GeneratingReport)
                          ? null
                          : () {
                              context.read<GenerateReportBloc>().add(
                                    GetReportEvent(first, last),
                                  );
                            },
                  child: const Text("Generate Report"),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  onPressed: (state is SuccessState)
                      ? () {
                          context.read<GenerateReportBloc>().add(
                                ShareReportEvent(state.file),
                              );
                        }
                      : null,
                  label: const Text("Share"),
                  icon: const Icon(Icons.share),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
