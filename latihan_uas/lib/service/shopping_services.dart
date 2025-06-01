import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ShoppingServices {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref('shopping_list');
  
  Stream<Map<String, Map<String, String>>> getShoppingList() {
  return _databaseReference.onValue.map((event) {
    final Map<String, Map<String, String>> items = {};
    DataSnapshot snapshot = event.snapshot;
    if (snapshot.value != null) {
      Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
      values.forEach((key, value) {
        items[key] = {
          'name': value['name'] as String,
          'jenis': value['jenis'] as String,
        };
      });
    }
    return items;
  });
}


  void addShoppingItem(String itemName, String itemJenis) {
    _databaseReference.push().set({'name': itemName, 'jenis': itemJenis});
  }

  void removeShoppingItem(String key) {
    _databaseReference.child(key).remove();
  }

}