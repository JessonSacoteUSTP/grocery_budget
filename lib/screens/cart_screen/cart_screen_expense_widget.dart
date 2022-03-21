// @dart=2.9
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../app_state/cart_data.dart';

class ExpenseWidget extends StatefulWidget {
  @override
  _ExpenseSTState createState() => _ExpenseSTState();
}

class _ExpenseSTState extends State<ExpenseWidget> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = Provider.of<CartData>(context).totalPrice;
    return Center(
      child: Center(
          child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
        child: Column(
          children: <Widget>[
            RichText(
                text: TextSpan(
                    text: '₱',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                        fontSize: 40),
                    children: <TextSpan>[
                  TextSpan(                  
                    text: totalPrice.toStringAsFixed(2),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.deepOrange[900],
                        fontSize: 60),
                  )
                ]))
          ],
        ),
      )),
    );
  }
}
