// @dart=2.9
import 'package:flutter/material.dart';
import '../../utils/screen_logo.dart';
import 'shopping_screen_form.dart';

class StartShopping extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white, //page color
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.grey[500]),
            onPressed: () => Navigator.pushNamed(context, '/homescreen')),

        centerTitle: true,
        backgroundColor: Colors.white, //appbar color
        elevation: 0,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.grey[500],
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              }),
        ],
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
                    'Shop',
                    style: TextStyle(
                        color: Colors.deepOrange[900],
                        fontSize: 40,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.shopping_cart,
                    size: 35,
                    color: Colors.grey[600],
                  )),
              Expanded(child: ShoppingForm()),
            ],
          )));
}
