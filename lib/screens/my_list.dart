// @dart=2.9
import 'dart:developer';

import 'package:flutter/material.dart';


class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white, //page color
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.grey, //color sa back
          ),
          title: Text(
            'My List',
            style: TextStyle(
                color: Colors.orange[900], //title color
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white, //appbar color
          elevation: 1.0,
        ),
        body: MyApp(),
      );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Mon app",
      home: Scaffold(
          appBar: AppBar(
              title: Text("My app")
          ),
          body: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.map),
                        title: Text('Map'),
                      ),
                      ListTile(
                        leading: Icon(Icons.photo_album),
                        title: Text('Album'),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('Phone'),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('Phone'),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('Phone'),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('Phone'),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('Phone'),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('Phone'),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('Phone'),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('Phone'),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('Phone'),
                      ),

                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "What to do?"
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: (){
                        //do something :)
                      },
                    )
                  ],
                )
              ],
          ),
      ),
    );
  }
}

