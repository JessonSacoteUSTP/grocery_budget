// @dart=2.9
import 'package:flutter/cupertino.dart';
import '../models/items.dart';

class CartData extends ChangeNotifier {
  List<Items> _additems = [];

  List<Items> get items => _additems;

  get cartitems => _additems;

  double get totalPrice {
    double totalPrice = 0;

    for (var i = 0; i < _additems.length; i++) {
      totalPrice += _additems[i].price;
    }

    return totalPrice;
  }

  void addItems(item) {
    _additems.add(item);
    notifyListeners();
  }

  void removeItem(item) {
    _additems.remove(item);
    notifyListeners();
  }

  void removeAll() {
    _additems.clear();
    notifyListeners();
  }

  void insertData(idx, item) {
    print('INSERT NOTOFY 1');
    _additems.insert(idx, item);
    print('INSERT NOTOFY 2');
    notifyListeners();
    print('INSERT NOTOFY 3');
  }
}
