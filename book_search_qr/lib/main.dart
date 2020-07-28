import 'dart:collection';
import 'dart:math';
import 'dart:ui';


import 'package:book_search_qr/src/all_books.dart';
import 'package:book_search_qr/src/pages/barcodeCamPage.dart';
import 'package:book_search_qr/src/pages/wishlist.dart';
import 'package:book_search_qr/src/search_result_bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => WishlistNotifier(),
    ),
    Provider<SearchResultBloc>(
      create: (_) => SearchResultBloc(),
    ),

  ], child: BookSearchApp()));
}



class BookSearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/a': (BuildContext context) => SearchBarcodeScreen(),
      },
      theme: ThemeData(
        primaryColor: Colors.brown,
        backgroundColor: Colors.brown,
        scaffoldBackgroundColor: Colors.brown,
        accentColor: Colors.blue,
      ),
      title: "QRBook",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentPage = 1;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QRBook"),
        leading: Icon(Icons.bookmark),
      ),
      body:  _currentPage == 1 ? SearchScreen() : WishlistScreen(),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(
          color: Colors.blue,
        ),
        currentIndex: _currentPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text("Library"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text("Search")),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text("WishList"))
        ],
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchTerm = "İlk";


  _updateSearch(String str,BuildContext context) {
    setState(() {
      searchTerm = str;
      Provider.of<SearchResultBloc>(context,listen: false).updateSearch(str);
    });
  }

  _updateSearchWithBarcode(String str,BuildContext context) {
    setState(() {
      searchTerm = str;
      Provider.of<SearchResultBloc>(context,listen: false).updateSearchWB(str);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MySearchBar(
          parentAction: _updateSearch,
          parentAction2: _updateSearchWithBarcode,
        ),
        Expanded(child: SearchResult())
      ],
    );
  }
}

class SearchResult extends StatefulWidget {
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UnmodifiableListView<Book>>(
      stream: Provider.of<SearchResultBloc>(context).books,
      initialData: UnmodifiableListView<Book>([]),
      builder: (context, snapshot) {
        return ListView(
          children: snapshot.data.isNotEmpty
              ? snapshot.data.map((b) => _buildBookItem(b, context)).toList()
              : [
                  ListTile(
                    leading: CircularProgressIndicator(
                      value: null,
                    ),
                    title: Text("Loading"),
                  )
                ],
        );
      },
    );
  }
}

Widget barcodeSearchIcon() {
  return Transform.rotate(
    angle: -90 * pi / 180,
    child: Icon(Icons.line_weight),
  );
}

Widget _buildBookItem(Book b, BuildContext context) {
    return Padding(
    key: Key(b.id.toString()),
    padding: const EdgeInsets.all(8.0),
    child: new Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Colors.grey[300],
      ),
      padding: EdgeInsets.all(10.0),
      child: new ListTile(
        leading: Icon(Icons.bookmark),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon:Provider.of<WishlistNotifier>(context).wishlist.contains(b.id)? Icon(Icons.star_border):Icon(Icons.star),
              onPressed: () {
                Provider.of<WishlistNotifier>(context, listen: false)
                    .appendBook(b);
              },
            ),
            IconButton(
              icon: Icon(Icons.add_circle_outline),
              onPressed: () {
                print("button");
              },
            ),
          ],
        ),
        title: Text(
          b.volumeInfo.title,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        subtitle: b.volumeInfo.industryIdentifiers.length > 0
            ? Text(b.volumeInfo.industryIdentifiers.first.identifier)
            : Text("No ISBN data"),
      ),
    ),
  );
}

class Ext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ],
    );
  }
}

class MySearchBar extends StatefulWidget {
  final void Function(String value,BuildContext context) parentAction;
  final void Function(String value,BuildContext context) parentAction2;

  MySearchBar({Key key, this.parentAction, this.parentAction2})
      : super(key: key);

  @override
  _MySearchBarState createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  final isVertical = false;
  final _controller = TextEditingController();
  _SearchScreenState parentState;

  String searchTerm;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final text = _controller.text;
      _controller.value = _controller.value.copyWith(
          text: text,
          selection:
              TextSelection(baseOffset: text.length, extentOffset: text.length),
          composing: TextRange.empty);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300],
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 4,
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Search",
              ),
              onTap: () {},
            ),
          ),
          Flexible(
            flex: 1,
            child: RawMaterialButton(
              highlightColor: Colors.transparent,
              fillColor: Colors.transparent,
              child: IconButton(
                splashColor: Colors.blue,
                iconSize: 30,
                icon: Icon(Icons.search),
                onPressed: () {
                  widget.parentAction(_controller.value.text,context);
                  _controller.clear();
                },
              ),
              shape: CircleBorder(),
            ),
          ),
          Flexible(
            flex: 1,
            child: RawMaterialButton(
              highlightColor: Colors.transparent,
              fillColor: Colors.transparent,
              child: IconButton(
                splashColor: Colors.blue,
                iconSize: 30,
                icon: barcodeSearchIcon(),
                onPressed: () async {
                  String barcode =
                      await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SearchBarcodeScreen(),
                  ));
                  widget.parentAction2(barcode,context);
                  _controller.clear();
                },
              ),
              shape: CircleBorder(),
            ),
          ),
        ],
      ),
    );
  }

  void getInput(String searchTerm) {
    print(searchTerm);
  }
}
