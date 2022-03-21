// @dart=2.9
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

bool run;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white, //page color
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey[500]),
          centerTitle: true,
          backgroundColor: Colors.white, //appbar color
          elevation: 0,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  child: SizedBox(
                      child: Image.asset(
                'assets/app_logo_small.png',
              ))),
              ListTile(
                leading: Icon(Icons.store_mall_directory),
                title: Text(
                  'Shop',
                  style: TextStyle(
                      color: Colors.deepOrange[900],
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/startShopping');
                },
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text(
                  'Cart',
                  style: TextStyle(
                      color: Colors.deepOrange[900],
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/cart');
                },
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                leading: Icon(Icons.access_time),
                title: Text(
                  'History',
                  style: TextStyle(
                      color: Colors.deepOrange[900],
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/myList');
                },
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text(
                  'More Info',
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  showAboutDialog(
                      context: context,
                      applicationVersion: 'Version: 1.0.2',
                      applicationIcon: Image.asset(
                        'assets/app_logo_xsmall.png',
                        height: 100,
                        width: 100,
                      ),
                      children: [
                        Text(
                            'Grocery Budget helps you to track your expenses in the grocery and make sure that you are spending your hard earn money right.\n\nDevelopers: \nJay Anne Arquiza'),
                      ]);
                },
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/app_lower_graphics_50_50.png"),
                  //image: AssetImage("assets/app_logo_small.png"),

                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.fitWidth)),
          child: HomePage(),
        ),
      );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              child: SizedBox(
                  height: 130,
                  child: Image.asset(
                    'assets/app_logo.png',
                  ))),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.values[2],
              children: <Widget>[
                Center(
                  child: SizedBox(
                    width: 38.0.w,
                    height: 13.0.h,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(children: <Widget>[
                        Text(
                          "My \nList     ",
                          style: TextStyle(
                              color: Colors.deepOrange[900],
                              fontSize: 25,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.collections_bookmark,
                          size: 35,
                          color: Colors.grey[600],
                        ),
                      ]),
                      color: Colors.white,
                      elevation: 10,
                      onPressed: () {
                        run = true;
                        Navigator.pushNamed(context, '/myList');
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        width: 38.0.w,
                        height: 13.0.h,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(children: <Widget>[
                            Text(
                              "History",
                              style: TextStyle(
                                  color: Colors.deepOrange[900],
                                  fontSize: 23,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.access_time,
                              size: 35,
                              color: Colors.grey[600],
                            ),
                          ]),
                          color: Colors.white,
                          elevation: 10,
                          onPressed: () {
                            run = true;

                            Navigator.pushNamed(context, '/historyscreen');
                          },
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            width: 290,
            height: 50,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.orange[900],
              elevation: 10,
              onPressed: () {
                Navigator.pushNamed(context, '/startShopping');
              },
              child: Text(
                "Shop",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 46),
        ],
      ),
    );
  }
}
