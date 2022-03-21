// @dart=2.9
import 'package:flutter/material.dart';
import 'cart_screen_alertDialog.dart';
import 'cart_screen_expense_widget.dart';
import 'cart_screen_itemList.dart';


class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white, //page color
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.grey[500]),
                onPressed: () =>
                    Navigator.pushNamed(context, '/startShopping')),

            centerTitle: true,
            backgroundColor: Colors.white, //appbar color
            elevation: 0,
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.save_alt,
                    color: Colors.grey[500],
                  ),
                  onPressed: () {
                    showAlertDialog(context);
                  }),
            ]),
        body:  Container(
         decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage("assets/page_back.jpg"),
             alignment: Alignment.bottomCenter,
             fit: BoxFit.fitWidth
             )
             ),
        
        child: Column(
          children: <Widget>[
            Text(
              'Expense',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 15,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),        
            ExpenseWidget(),
            Expanded(child: ItemsInCart()),
          ],
        ),
        )
      );
}
