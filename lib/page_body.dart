import 'package:flutter/material.dart';

class PageBody extends StatelessWidget {
  Widget _child;

  PageBody({child}) {
    this._child = child;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _child,
    );
  }
}
