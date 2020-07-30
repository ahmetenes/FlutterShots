import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../all_books.dart';

class WishlistScreen extends StatefulWidget {
  Set<Book> wishlist;

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}


class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.star),
        title: Text("Wishlist"),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("wishlist").snapshots(),
        builder: (context, snapshot) {

          return snapshot.hasData?
          ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(Icons.star),
                  title: Text(snapshot.data.documents[index]['title']),
                ),
              );
            },
          ):Text("data");
        },
      ),
    );
  }
}




class WishlistNotifier with ChangeNotifier {


  void appendBook(Book b,BuildContext context) {
    Provider.of<Firestore>(context,listen: false).collection("wishlist").add({
      "title":b.volumeInfo.title,
      "id":b.id,
    });

    notifyListeners();
  }

  Future<void> removeBook(Book b,BuildContext context) async {
    DocumentReference docRef = await
    Provider.of<Firestore>(context,listen: false).collection("wishlist").getDocuments()
        .then((value) => value.documents.where((element) => element.data["id"]==b.id).toList())
        .then((value) => value.first.reference);
    await docRef.delete();
    notifyListeners();
  }
}
