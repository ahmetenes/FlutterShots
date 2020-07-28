import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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



class WishListView extends StatelessWidget {
  const WishListView({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final WishlistScreen widget;

  @override
  Widget build(BuildContext context) {
    widget.wishlist.length > 0 ? print("wishlist exist") : print("nonexist");
    return ListView(
      children: widget.wishlist.map((book) {
        return ListTile(
          title: Text(book.volumeInfo.title),
        );
      }).toList(),
    );
  }
}

class WishlistNotifier with ChangeNotifier {
  static List _wishlist = [];

  final sub = Firestore.instance.collection("wishlist").snapshots().listen((event) {_wishlist = event.documents.map((e) => e.data["id"]).toList();});

   get wishlist =>_wishlist;

  void appendBook(Book b) {
    Firestore.instance.collection("wishlist").add({
      "title":b.volumeInfo.title,
      "id":b.id,
    });

    notifyListeners();
  }

  void removeBook(Book b) {


    notifyListeners();
  }
}
