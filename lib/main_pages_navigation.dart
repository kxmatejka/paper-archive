import 'package:flutter/material.dart';
import 'pages/print_form.dart';
import 'pages/scan.dart';

class MainPagesNavigation extends StatefulWidget {
  final List routes = [
    {
      'title': 'Backup',
      'widget': PrintForm(),
    },
    {
      'title': 'Recover',
      'widget': Scan(),
    },
  ];

  @override
  _MainPagesNavigationState createState() => _MainPagesNavigationState();
}

class _MainPagesNavigationState extends State<MainPagesNavigation> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.routes[currentIndex]['title']),
      ),
      body: widget.routes[currentIndex]['widget'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        iconSize: 30,
        onTap: (index) => navigateToPage(index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.print),
            label: 'Backup',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.scanner),
            label: 'Recover',
          ),
        ],
      ),
    );
  }

  navigateToPage(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
