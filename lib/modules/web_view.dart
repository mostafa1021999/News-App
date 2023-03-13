import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
class webview extends StatelessWidget {
  const webview({Key? key, required this.web}) : super(key: key);
  final String web;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: WebView(
        initialUrl: web,
      ),
    );
  }
}

