import 'dart:collection';
import 'dart:ui';

import 'package:book_search_qr/src/all_books.dart';
import 'package:book_search_qr/src/search_result_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:barcode_reader/barcode_reader.dart';

void main() {
  runApp(BookSearchApp());
}

class BookSearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.brown,
        backgroundColor: Colors.brown,
        scaffoldBackgroundColor: Colors.brown,
        accentColor: Colors.white,
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
      body: _currentPage == 1 ? SearchScreen() : SearchBarcodeScreen(),
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
              icon: Icon(Icons.camera), title: Text("Barcode"))
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

class SearchBarcodeScreen extends StatefulWidget {
  @override
  _SearchBarcodeScreenState createState() => _SearchBarcodeScreenState();
}

class _SearchBarcodeScreenState extends State<SearchBarcodeScreen> {
  final BarcodeReader reader = new BarcodeReader();
  int textureId;
  Future<void> getTextureId() async {
    int _textureId;
    _textureId = await BarcodeReader.openCamera;

    setState(() {
      textureId = _textureId;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTextureId();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        textureId != null
            ? Flexible(flex: 1, child: Texture(textureId: textureId))
            : Center(

              child: CircularProgressIndicator(
                  value: null,
                ),
            ),
      ],
    );
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchTerm = "İlk";
  final bloc = SearchResultBloc();

  _updateSearch(String str) {
    setState(() {
      searchTerm = str;
      this.bloc.updateSearch(str);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MySearchBar(
          parentAction: _updateSearch,
        ),
        Expanded(
            child: SearchResult(
          bloc: bloc,
        ))
      ],
    );
  }
}

class SearchResult extends StatefulWidget {
  final SearchResultBloc bloc;

  SearchResult({Key key, this.bloc}) : super(key: key);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UnmodifiableListView<Book>>(
      stream: widget.bloc.books,
      initialData: UnmodifiableListView<Book>([]),
      builder: (context, snapshot) {
        return ListView(
          children: snapshot.data.isNotEmpty
              ? snapshot.data.map(_buildBookItem).toList()
              : [
                  ListTile(
                    leading: CircularProgressIndicator(value: null,),
                    title: Text("Loading"),
                  )
                ],
        );
      },
    );
  }
}

Widget _buildBookItem(Book b) {
  return Padding(
    key: Key(b.id.toString()),
    padding: const EdgeInsets.all(8.0),
    child: new Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Colors.grey[300],
      ),
      padding: EdgeInsets.all(10.0),
      child: new ExpansionTile(
        leading: Icon(Icons.bookmark),
        title: Text(
          b.volumeInfo.title,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              b.volumeInfo.industryIdentifiers.length > 0
                  ? Text(b.volumeInfo.industryIdentifiers.first.identifier
                      .toString())
                  : Text("No ISBN"),
              RawMaterialButton(
                highlightColor: Colors.transparent,
                fillColor: Colors.transparent,
                child: IconButton(
                  splashColor: Colors.blue,
                  iconSize: 30,
                  icon: Icon(Icons.link),
                  onPressed: () {
                    launch(b.selfLink);
                  },
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              )
            ],
          ),
        ],
        initiallyExpanded: false,
      ),
    ),
  );
}

class MySearchBar extends StatefulWidget {
  final void Function(String value) parentAction;

  MySearchBar({Key key, this.parentAction}) : super(key: key);

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
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Search",
              ),
              onTap: () {},
            ),
          ),
          RawMaterialButton(
            highlightColor: Colors.transparent,
            fillColor: Colors.transparent,
            child: IconButton(
              splashColor: Colors.blue,
              iconSize: 30,
              icon: Icon(Icons.search),
              onPressed: () {
                widget.parentAction(_controller.value.text);
                _controller.clear();
              },
            ),
            padding: EdgeInsets.all(15.0),
            shape: CircleBorder(),
          )
        ],
      ),
    );
  }

  void getInput(String searchTerm) {
    print(searchTerm);
  }
}
