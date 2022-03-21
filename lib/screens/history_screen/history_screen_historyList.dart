// @dart=2.9
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_state/database/historyDatabase.dart';
import '../home_screen/home_screen.dart';

List<HistoryModel> historyList = [];

final HistoryDatabase _historyDatabase = HistoryDatabase();

class ItemsInHistory extends StatefulWidget {
  @override
  _ItemsInHistoryState createState() => _ItemsInHistoryState();
}

class _ItemsInHistoryState extends State<ItemsInHistory> {
  initializeList() async {
    run = false;
    print('List void');

    List<HistoryModel> list = await _historyDatabase.getAllTask();

    setState(() {
      print('xxList $historyList');
      historyList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Print List');
    if (run == true) {
      print('CHECK IF TRUE');
      initializeList();

      print(run);
    }

    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: historyList.length,
          itemBuilder: (context, idx) {
            return Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Dismissible(
                  direction: DismissDirection.endToStart,
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.beenhere,
                        color: Colors.green,
                      ),
                      title: Text(
                        historyList[idx].date,
                        textScaleFactor: 1.3,
                      ),
                      subtitle: Text(historyList[idx].time),
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
                              text: historyList[idx].expense + '0',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.red,
                                  fontSize: 20),
                            )
                          ])),
                    ),
                  ),
                  onDismissed: (direction) {
                    int deletedItem = historyList[idx].id;
                    print('DELETED ITEM $deletedItem');
                    _historyDatabase.delete(deletedItem);
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
                    Text(historyList[idx].date),
                  )),
            );
          }),
    );
  }
}
