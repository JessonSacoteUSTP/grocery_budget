// @dart=2.9
import 'package:flutter/material.dart';
import '../../utils/screen_logo.dart';
import 'history_screen_historyList.dart';

Text screenName = Text('History');

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white, //page color

        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.grey, //color sa back
          ),
          backgroundColor: Colors.white, //appbar color
          elevation: 0,
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/page_back.jpg"),
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.fitWidth)),
            child: Column(
              children: <Widget>[
                LogoWidgets.getLogoWidget(
                    Text(
                      'History',
                      style: TextStyle(
                          color: Colors.deepOrange[900],
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.access_time,
                      size: 35,
                      color: Colors.grey[600],
                    )),
                Expanded(child: ItemsInHistory()),
              ],
            )),
      );
}
