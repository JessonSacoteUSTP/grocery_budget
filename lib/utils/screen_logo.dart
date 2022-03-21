// @dart=2.9
import 'package:flutter/material.dart';

class LogoWidgets{
  static getLogoWidget(Text screenName,Icon iconScreen){
    return Center(
      child: Center(
          child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
        child: Column(
          children: <Widget>[
            screenName,
            iconScreen
          ],
        ),
      )),
    );

  }
}