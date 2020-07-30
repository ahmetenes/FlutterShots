
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core';

import 'package:flutter/cupertino.dart';

class FirebaseDatabase {
  final Firestore _database = Firestore.instance;

  Stream<List<String>> get wishlistIds {
    print("wishlist data called");
    return Firestore.instance.collection("wishlist").snapshots().map(
        (QuerySnapshot querySnapshot) => querySnapshot.documents
            .map((DocumentSnapshot documentSnapshot)
                => documentSnapshot.data["id"] as String)
            .toList());
  }
  Stream<QuerySnapshot> get stream {
    return _database.collection("wishlist").snapshots();
  }
  Firestore get database => _database;
}
