import 'package:flutter/material.dart';
import 'package:secureshiksha_school/core/error_widgets/my_snack_bar.dart';
import 'package:secureshiksha_school/core/http_requests/post_request.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  TextEditingController reportController = TextEditingController();
  bool _isLoading = false;
  @override
  void dispose() {
    reportController.dispose();
    super.dispose();
  }

  void sendReport() async {
    setState(() {
      _isLoading = true;
    });
    if (reportController.text.trim().isEmpty) {
      MySnackBar.showSnackBar(
        ctx: context,
        message: "Please enter valid feedback",
      );
    }
    final result = await PostRequest.request(
      "report",
      {
        "dateTime": DateTime.now().toString(),
        "reportQuery": reportController.text
      },
    );
    result.fold(
      (l) {
        reportController.clear();
        MySnackBar.showSnackBar(
          ctx: context,
          message: "Report successfully send",
        );
        setState(() {
          _isLoading = false;
        });
      },
      (r) {
        MySnackBar.showSnackBar(
          ctx: context,
          message: " Please try again| Error: ${r.message}",
        );
        setState(() {
          _isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Report"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RichText(
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
            const SizedBox(
              height: 20,
            ),
            const Text(
              "RegEx is an RFID based attendance monitoring system specially designed for schools. Your feedback is very important for us to improve this product.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: reportController,
              minLines: 10,
              maxLines: 15,
              decoration: const InputDecoration(
                  label: Text("Type your feedback/suggestion/query..")),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () {
                        sendReport();
                      },
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text("Report"))
          ],
        ),
      ),
    );
  }
}
