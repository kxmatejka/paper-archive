import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/scan.dart';

class PageBody extends StatelessWidget {
  Widget _child;

  PageBody({child}) {
    this._child = child;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Archiver'),
      ),
      body: Container(
        child: _child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        iconSize: 30,
        onTap: (index) {
          if (index == 1) {
            Get.to(Scan());
          }
        },
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
}
