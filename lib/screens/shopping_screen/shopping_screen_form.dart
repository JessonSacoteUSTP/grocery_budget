// @dart=2.9
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../app_state/cart_data.dart';
import '../../models/items.dart';

class ShoppingForm extends StatefulWidget {
  @override
  _ShoppingFormState createState() => _ShoppingFormState();
}

class _ShoppingFormState extends State<ShoppingForm> {
  final _formKey = GlobalKey<FormState>();

  //List<Shopping> shop =[];
  int quantityPrice = 0;
  Items _items = Items();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
        //  padding: MainAxisAlignment.spaceBetween,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //SizedBox(child: Text('Item',style: TextStyle(color: Colors.deepOrange,fontSize: 20),),),
              //SizedBox()
              _itemNameField(),
              SizedBox(height: 15),
              //SizedBox(height: 10,child: Text('data'),),
              _quantityField(),
              SizedBox(height: 15),
              _priceField(),

              _saveButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemNameField() => TextFormField(
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
        keyboardType: TextInputType.name,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          filled: true,
          //alignLabelWithHint: true,

          fillColor: Colors.white,
          //hintText: 'Item Name',
          contentPadding: const EdgeInsets.only(bottom: 20.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.red),
            borderRadius: new BorderRadius.circular(25.7),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.blueGrey),
            borderRadius: new BorderRadius.circular(25.7),
          ),
          //labelText: 'Item',
          hintText: 'Enter Item Name',
          // icon: Icon(Icons.shopping_cart)
        ),
        validator: (value) {
          if (value.isEmpty) return 'Please Enter item name!';
          return null;
        },
        onSaved: (value) {
          _items.itemName = value;
        },
      );

  Widget _quantityField() => TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.only(bottom: 20.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.red),
            borderRadius: new BorderRadius.circular(25.7),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.blueGrey),
            borderRadius: new BorderRadius.circular(25.7),
          ),
          hintText: 'Enter Quantity',
        ),
        validator: (value) {
          if (value.isEmpty) return 'Please Enter item quantity';
          return null;
        },
        onSaved: (value) {
          _items.quantity = int.parse(value);
          quantityPrice = int.parse(value);
        },
      );

  Widget _priceField() => TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.only(bottom: 20.0, top: 8.0),
          // contentPadding:
          //     const EdgeInsets.only(left: 28.0, bottom: 20.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.red),
            borderRadius: new BorderRadius.circular(25.7),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.blueGrey),
            borderRadius: new BorderRadius.circular(25.7),
          ),
          //border: BorderSide(color: Colors.accents),
          //disabledBorder: ,
          hintText: 'Enter Price',
        ),
        validator: (value) {
          if (value.isEmpty) return 'Please Enter item price';
          return null;
        },
        onSaved: (value) {
          double valTimePrice = double.parse(value) * quantityPrice;
          _items.price = valTimePrice;
        },
      );

  Widget _saveButton() => Container(
        padding: EdgeInsets.only(top: 50),
        child: SizedBox(
          width: 100,
          height: 48,
          child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Colors.white,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                Provider.of<CartData>(context, listen: false).addItems(_items);
                _formKey.currentState.reset();
                inspect(_items);
                Navigator.pushNamed(context, '/startShopping');
              }
            },
            child: Text(
              "Add",
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            elevation: 20,
          ),
        ),
      );
}
