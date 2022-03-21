// @dart=2.9
import 'package:flutter/material.dart';


import '../../app_state/database/historyDatabase.dart';

final HistoryDatabase _historyDatabase = HistoryDatabase();

showAlertDialog(BuildContext context) {
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
      //_historyDatabase.delete(id);
      Navigator.of(context, rootNavigator: true).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Clear List"),
    content: Text("Would you like to clear your history?"),
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