import 'package:flutter/material.dart';
import 'package:secureshiksha_school/core/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final WebViewController controller = WebViewController();
  bool _isloading = true;
  @override
  void initState() {
    controller.loadRequest(
      Uri.parse(aboutPageUrl),
    );
    controller.setNavigationDelegate(NavigationDelegate(
      onPageFinished: (url) {
        setState(() {
          _isloading = false;
        });
      },
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: _isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : WebViewWidget(
              controller: controller,
            ),
    );
  }
}
