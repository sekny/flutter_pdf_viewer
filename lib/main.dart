import 'package:flutter/material.dart';
import 'package:pdf_url_viewer/demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const ViewPDFDemo(),
    );
  }
}
