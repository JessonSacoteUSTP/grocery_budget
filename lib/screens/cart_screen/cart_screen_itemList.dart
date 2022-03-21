// @dart=2.9
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_state/cart_data.dart';
import '../../models/items.dart';

class ItemsInCart extends StatefulWidget {
  @override
  _ItemsInCartState createState() => _ItemsInCartState();
}

class _ItemsInCartState extends State<ItemsInCart> {
  @override
  Widget build(BuildContext context) {
    List<Items> cartItems = Provider.of<CartData>(context).cartitems;

    return ListView.builder(
        shrinkWrap: true,
        itemCount: cartItems.length,
        itemBuilder: (context, idx) {
          var itemQuantity = cartItems[idx].quantity;
          var itemPrice = cartItems[idx].price;
          return Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Dismissible(
             direction: DismissDirection.endToStart,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.beenhere,
                    color: Colors.green,
                  ),
                  title: Text(
                    cartItems[idx].itemName,
                    textScaleFactor: 1.3,
                  ),
                  subtitle: Text(itemQuantity.toString()+' pcs'),
                  trailing: RichText(
                          text: TextSpan(
                            text: '₱',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 20),
                            children: <TextSpan>[
                              TextSpan(
                                text: itemPrice.toStringAsFixed(2),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.red,
                                    fontSize: 20),
                              )])),          
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  Items deletedItem = cartItems[idx];
                  String deletedItemName = cartItems[idx].itemName;
                  Provider.of<CartData>(context, listen: false)
                      .removeItem(cartItems[idx]);
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Deleted \"$deletedItemName\""),
                    action: SnackBarAction(
                      label: "UNDO",
                      onPressed: () => setState(() {
                        Provider.of<CartData>(context, listen: false)
                            .insertData(idx, deletedItem);
                      }),
                    ),
                  ));
                });
              },
              background: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.red,
                  child: Align(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        Text(
                          " Delete",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    alignment: Alignment.centerRight,
                  )),
                  key: ValueKey(
              Text(cartItems[idx].itemName),
            ),
            
            ),
          );
        });
  }
}
