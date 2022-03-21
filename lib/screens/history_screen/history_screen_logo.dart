// @dart=2.9
import 'package:flutter/material.dart';

class HistoryLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
          child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
        child: Column(
          children: <Widget>[
            Text(
              'History',
              style: TextStyle(
                color: Colors.deepOrange[900],
                fontSize: 40,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.access_time,
              size: 35,
              color: Colors.grey[600],
            ),
          ],
        ),
      )),
    );
  }
}
