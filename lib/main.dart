import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/print_form.dart';

main() => runApp(PaperArchive());

class PaperArchive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Paper archive',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PrintForm(),
    );
  }
}
