// @dart=2.9
import 'package:flutter/material.dart';

class MyListLogo extends StatelessWidget {
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
              'My List',
              style: TextStyle(
                color: Colors.deepOrange[900],
                fontSize: 40,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.collections_bookmark,
              size: 35,
              color: Colors.grey[600],
            ),
          ],
        ),
      )),
    );
  }
}
