// @dart=2.9
import 'package:flutter/material.dart';
import '../../app_state/database/myList_database.dart';
import '../../utils/screen_logo.dart';
import '../home_screen/home_screen.dart';
import 'my_list_screen_list.dart';

class MyListScreen extends StatefulWidget {
  @override
  _MyListScreenState createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white, //page color
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.grey, //color sa back
          ),
          backgroundColor: Colors.white, //appbar color
          elevation: 0,
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
                      'My List',
                      style: TextStyle(
                          color: Colors.deepOrange[900],
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.access_time,
                      size: 35,
                      color: Colors.grey[600],
                    )),
                Expanded(child: ItemsInMyList()),
              ],
            )),

        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          // isExtended: true,
          child: Icon(Icons.add),
          backgroundColor: Colors.deepOrange[700],
          onPressed: () {
            showInformationDialog(context);
          },
        ),
      );
}

String _itemName;
String _qty;
final MyListDatabase _myListDatabase = MyListDatabase();
MyListModel currentTask;
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

final initxx = ItemsInMyList();

showInformationDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            scrollable: true,
            title: Center(child: Text('Add Item')),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15)),
            content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: const EdgeInsets.only(
                            left: 28.0, bottom: 20.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.deepOrange),
                          borderRadius: new BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white),
                          borderRadius: new BorderRadius.circular(25.7),
                        ),
                        labelText: 'Item Name',
                      ),
                      validator: (value) {
                        return value.isNotEmpty ? null : "Invalid Field";
                      },

                      onSaved: (value) {
                        _itemName = value;
                        print('Item name is: $_itemName');
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: const EdgeInsets.only(
                            left: 28.0, bottom: 20.0, top: 8.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.deepOrange),
                          borderRadius: new BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white),
                          borderRadius: new BorderRadius.circular(25.7),
                        ),
                        labelText: 'Quantity',
                        //icon: Icon(Icons.add_circle_outline),
                      ),
                      validator: (value) {
                        return value.isNotEmpty ? null : "Invalid Field";
                      },
                      onSaved: (value) {
                        _qty = value;
                        print('Item name is: $_qty');
                      },
                    ),
                    SizedBox(height: 20),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Colors.orange[900],
                      child: Text("Add Item"),
                      textColor: Colors.white,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          currentTask =
                              MyListModel(name: _itemName, qty: _qty, id: 0);
                          print('insert data --> $currentTask');
                          _myListDatabase.insertTask(currentTask);
                          run = true;
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ],
                )),
          );
        });
      });
}
