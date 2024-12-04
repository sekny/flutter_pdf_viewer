import 'package:flutter/material.dart';
import 'package:pdf_url_viewer/pdf_url_viewer.dart';

class ViewPDFDemo extends StatefulWidget {
  const ViewPDFDemo({super.key});

  @override
  State<ViewPDFDemo> createState() => _ViewPDFDemoState();
}

class _ViewPDFDemoState extends State<ViewPDFDemo> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("PDF Viewer Demo"),
      ),
      body: const PdfUrlViewer(url: "https://reparations.qub.ac.uk/assets/uploads/Cham-Culture_Book_LV06.pdf"),
    );
  }
}
