// @dart=2.9
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../app_state/database/myList_database.dart';
import '../home_screen/home_screen.dart';

String _itemName;
String _qty;

showAlertDialog(BuildContext context) {
  final MyListDatabase _myListDatabase = MyListDatabase();
  MyListModel currentTask;
  final _formKey = GlobalKey<FormState>();

  Widget _priceField() => TextFormField(
        key: _formKey,
        keyboardType: TextInputType.name,
        decoration:
            InputDecoration(labelText: 'Price', icon: Icon(Icons.attach_money)),
        validator: (value) {
          if (value.isEmpty) return 'Please Enter item price';
          return null;
        },
        onSaved: (value) {
          _itemName = value;
          print('Item name is: $_itemName');
        },
      );

  Widget _quantityField() => TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'Quantity', icon: Icon(Icons.add_circle_outline)),
        validator: (value) {
          if (value.isEmpty) return 'Please Enter item quantity';
          return null;
        },
        onSaved: (value) {
          _qty = value;
          print('Item name is: $_qty');
        },
      );

  // Center(child: Text('Add Item'))
  Widget _saveButton() => Container(
        padding: EdgeInsets.only(top: 25),
        child: SizedBox(
          width: 90,
          height: 40,
          child: FlatButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Colors.orange[900],
            onPressed: () {
              //if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              currentTask = MyListModel(name: _itemName, qty: _qty, id: 0);
              print('insert data $currentTask');
              _myListDatabase.insertTask(currentTask);
              run = true;
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: Text(
              "Add",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );

  AlertDialog alert = AlertDialog(
    scrollable: true,
    title: Center(child: Text('Add Item')),
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
                decoration: InputDecoration(
                  labelText: 'Iteddm Name',
                  icon: Icon(Icons.shopping_cart),
                ),
                validator: (value) {
                  print('IF EMPTY');
                  if (value.isEmpty) return 'Please Enter item Name';
                  print('object');
                  return null;
                },
                onSaved: (value) {
                  _itemName = value;
                }),
            TextFormField(
                decoration: InputDecoration(
                  labelText: 'Quantity',
                  icon: Icon(Icons.add_circle_outline),
                ),
                validator: (value) {
                  print('IF EMPTY');
                  if (value.isEmpty) return 'Please Enter item Quantity';
                  print('object');
                  return null;
                },
                onSaved: (value) {
                  _qty = value;
                }),
          ],
        ),
      ),
    ),
    actions: [],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
