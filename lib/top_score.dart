import 'package:flutter/material.dart';

class TopScore extends StatelessWidget {
  final String _top_user;
  final int _top_point;

  TopScore(this._top_user, this._top_point);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Top Score'),
        ),
        body: Center(
            child: Column(
          children: [
            Text("Top User: $_top_user"),
            Text("Top Point: $_top_point")
          ],
        )));
  }
}
