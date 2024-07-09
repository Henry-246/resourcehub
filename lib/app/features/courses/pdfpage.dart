import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfPage extends StatelessWidget {
  final String name;
  final String link;
  const PdfPage({
    super.key,
    required this.name,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name, overflow: TextOverflow.ellipsis),
        centerTitle: true,
      ),
      body: SfPdfViewer.network(link, ),
    );
  }
}
