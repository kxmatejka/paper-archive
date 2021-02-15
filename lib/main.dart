import 'package:flutter/material.dart';
import 'package:nav_router/nav_router.dart';
import 'package:paper_archive/main_pages_navigation.dart';
import 'main_pages_navigation.dart';

main() => runApp(PaperArchive());

class PaperArchive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paper archive',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPagesNavigation(),
      navigatorKey: navGK,
    );
  }
}
