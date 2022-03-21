// @dart=2.9
import 'package:flutter/cupertino.dart';
import '../models/history.dart';


class HistoryData extends ChangeNotifier {
  List<History> _additems = [];

  List<History> get items => _additems;

  get historyitems => _additems;

  void addItems(item) {
    _additems.add(item);
    notifyListeners();
  }

  void removeItem(item) {
    _additems.remove(item);
    notifyListeners();
  }

  


}
