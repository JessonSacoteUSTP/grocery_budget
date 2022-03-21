// @dart=2.9
import 'package:flutter/material.dart';
import '../../app_state/database/myList_database.dart';
import '../home_screen/home_screen.dart';

List<MyListModel> myListList = [];

final MyListDatabase _myListDatabase = MyListDatabase();

class ItemsInMyList extends StatefulWidget {
  @override
  _ItemsInMyListState createState() => _ItemsInMyListState();
}

class _ItemsInMyListState extends State<ItemsInMyList> {
  //final textController = TextEditingController();

  initializeList() async {
    run = false;
    print('List void');

    List<MyListModel> listx = await _myListDatabase.getAllTask();
    print('before SetState ++++');
    setState(() {
      print('1st List $myListList');
      myListList = listx;
      print('2nd myListList : $myListList');
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Print List9');
    if (run == true) {
      print('CHECK IF TRUE');
      initializeList();
      print('DONE INITIALIZEDX');

      print(run);
    }
    print('Print List 10');
    print('3rd myListList : $myListList');
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: myListList.length,
          itemBuilder: (context, idx) {
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
                        leading: Icon(Icons.beenhere, color: Colors.green),
                        title: Text(
                          (myListList[idx].name),
                          textScaleFactor: 1.3,
                        ),
                        subtitle: Text(''),
                        //subtitle: Text (myListList[idx].qty.toString()!=null?myListList[idx].qty:'QTY error'),
                        trailing: RichText(
                          text: TextSpan(
                            text: myListList[idx].qty,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 20),
                            children: <TextSpan>[
                              TextSpan(
                                //cart_prod_qty!=null?cart_prod_qty:''
                                text: ' pcs',
                                //text: (myListList[idx].qty.toString()!=null?myListList[idx].qty:'QTY error'),
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700],
                                    fontSize: 15),
                              )
                            ],
                          ),
                        )),
                  ),
                  onDismissed: (direction) {
                    int deletedItem = myListList[idx].id;
                    print('DELETED ITEM $deletedItem');
                    _myListDatabase.delete(deletedItem);
                    print('DELETED ITEM $deletedItem');
                  },
                  background: Card(
                      //elevation: 5,
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
                    Text(myListList[idx].name),
                  )),
            );
          }),
    );
  }
}
