// @dart=2.9
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../app_state/cart_data.dart';
import '../../app_state/database/historyDatabase.dart';

showAlertDialog(BuildContext context) {
  final HistoryDatabase _historyDatabase = HistoryDatabase();
  HistoryModel currentTask;

  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    textColor: Colors.grey,
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );
  Widget continueButton = FlatButton(
    child: Text("Continue"),
    textColor: Colors.deepOrange,
    onPressed: () {
      print('PRESSED CONTINUE');
      DateTime now = new DateTime.now();
      double totalPrice =
          Provider.of<CartData>(context, listen: false).totalPrice;

      currentTask = HistoryModel(
        date: DateFormat.yMMMd().format(now),
        time: DateFormat.jm().format(now),
        expense: (totalPrice.toString()), id: 0,
      );
      print('insert data $currentTask');
      _historyDatabase.insertTask(currentTask);
      Provider.of<CartData>(context, listen: false).removeAll();
      Navigator.of(context, rootNavigator: true).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Save cart"),
    content: Text("Would you like to save your cart to the history?"),
    actions: [
      cancelButton,
      continueButton,
    ],
    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
