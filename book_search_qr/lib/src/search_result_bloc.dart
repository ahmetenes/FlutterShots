import 'dart:collection';

import 'package:book_search_qr/src/all_books.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

class SearchResultBloc {
  final _booksSubject = BehaviorSubject<UnmodifiableListView<Book>>();

  Stream<UnmodifiableListView<Book>> get books => _booksSubject.stream;

  var _books = <Book>[];
  String _searchTerm = "faust";
  SearchResultBloc() {
    _getBooks().then((_) {
      _booksSubject.add(UnmodifiableListView(_books));
    });
  }
  Future<Null> updateSearch(String str) async {
    _books.clear();
    _searchTerm = str;

    return _getBooks().then((_) {
      _booksSubject.add(UnmodifiableListView(_books));
    });
  }
  Future<Null> updateSearchWB(String str) async{
    _books.clear();
    _searchTerm = str;

    return _getBooksWB().then((_) {
      _booksSubject.add(UnmodifiableListView(_books));
    });
  }

  Future<Null> _getBooks() async {
    List<Book> _booklist = await getBookItems(_searchTerm);

    _books = _booklist;
  }
  Future<Null> _getBooksWB() async {
    List<Book> _booklist = await getBookItemsWB(_searchTerm);

    _books = _booklist;
  }

  Future<List<Book>> getBookItems(String name) async {
    final url =
        "https://www.googleapis.com/books/v1/volumes?q=$_searchTerm &fields=items";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return parseBookList(response.body.toString());
    } else {
      throw NothingFetchedError('Anything found');
    }
  }

  Future<List<Book>> getBookItemsWB(String str) async{
    final url =
        "https://www.googleapis.com/books/v1/volumes?q=isbn:$_searchTerm &fields=items";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return parseBookList(response.body.toString());
    } else {
      throw NothingFetchedError('Anything found');
    }
  }



}

class NothingFetchedError {
  final String errMsg;

  NothingFetchedError(this.errMsg);
}
