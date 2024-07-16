import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DownloadPdfPage extends StatefulWidget {
  final String url;
  const DownloadPdfPage({super.key, required this.url});

  @override
  State<DownloadPdfPage> createState() => _DownloadPdfPageState();
}

class _DownloadPdfPageState extends State<DownloadPdfPage> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
    ..loadRequest(Uri.parse(widget.url))
    ..setJavaScriptMode(JavaScriptMode.unrestricted);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: controller),
    );
  }
}
