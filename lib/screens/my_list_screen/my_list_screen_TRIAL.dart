// @dart=2.9
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_state/database/myList_database.dart';

class MyListFormxx extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white, //page color
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.grey[500]),
              onPressed: () => Navigator.pushNamed(context, '/homescreen')),
          title: Text(
            'Shop',
            style: TextStyle(
                color: Colors.orange[900], //title color
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white, //appbar color
          elevation: 1.0,
        ),
        body: MyListForm(),
      );
}

class MyListForm extends StatefulWidget {
  @override
  _MyListFormState createState() => _MyListFormState();
}

class _MyListFormState extends State<MyListForm> {
  final _formKey = GlobalKey<FormState>();
  final MyListDatabase _myListDatabase = MyListDatabase();
  MyListModel currentTask;

  String _itemName;
  String _qty;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [_itemNameField(), _quantityField(), _saveButton()],
        ),
      ),
    );
  }

  Widget _itemNameField() => TextFormField(
        decoration:
            InputDecoration(labelText: 'Item', icon: Icon(Icons.shopping_cart)),
        validator: (value) {
          if (value.isEmpty) return 'Please Enter item name!';
          return null;
        },
        onSaved: (value) {
          _itemName = value;
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
        },
      );

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
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                currentTask = MyListModel(name: _itemName, qty: _qty, id: 0);
                print('insert data $currentTask');
                _myListDatabase.insertTask(currentTask);
              }
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
}
