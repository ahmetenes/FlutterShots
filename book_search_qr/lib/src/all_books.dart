library all_books;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';

part 'all_books.g.dart';

abstract class AllBooks implements Built<AllBooks, AllBooksBuilder> {
  AllBooks._();

  factory AllBooks([updates(AllBooksBuilder b)]) = _$AllBooks;

  @BuiltValueField(wireName: 'items')
  BuiltList<Book> get items;

  String toJson() {
    return json.encode(serializers.serializeWith(AllBooks.serializer, this));
  }

  static AllBooks fromJson(String jsonString) {
    return serializers.deserializeWith(
        AllBooks.serializer, json.decode(jsonString));
  }

  static Serializer<AllBooks> get serializer => _$allBooksSerializer;
}

List<Book> parseBookList(String jsonString)  {
  final parsed = jsonDecode(jsonString);
  AllBooks booklist = standardSerializers.deserializeWith(AllBooks.serializer,parsed);
  return booklist.items.toList();
}


abstract class Book implements Built<Book, BookBuilder> {
  Book._();

  factory Book([updates(BookBuilder b)]) = _$Book;

  @BuiltValueField(wireName: 'kind')
  String get kind;
  @BuiltValueField(wireName: 'id')@nullable
  String get id;
  @BuiltValueField(wireName: 'etag')@nullable
  String get etag;
  @BuiltValueField(wireName: 'selfLink')@nullable
  String get selfLink;
  @BuiltValueField(wireName: 'volumeInfo')
  VolumeInfo get volumeInfo;
  @BuiltValueField(wireName: 'saleInfo')
  SaleInfo get saleInfo;
  @BuiltValueField(wireName: 'accessInfo')
  AccessInfo get accessInfo;
  @BuiltValueField(wireName: 'searchInfo')
  SearchInfo get searchInfo;
  String toJson() {
    return json.encode(serializers.serializeWith(Book.serializer, this));
  }

  static Book fromJson(String jsonString) {
    return serializers.deserializeWith(
        Book.serializer, json.decode(jsonString));
  }

  static Serializer<Book> get serializer => _$bookSerializer;

}

Book parseBook(String jsonString){
  final parsed = jsonDecode(jsonString);
  Book book =standardSerializers.deserializeWith(Book.serializer,parsed);
  return book;
}


abstract class VolumeInfo implements Built<VolumeInfo, VolumeInfoBuilder> {
  VolumeInfo._();

  factory VolumeInfo([updates(VolumeInfoBuilder b)]) = _$VolumeInfo;

  @BuiltValueField(wireName: 'title')@nullable
  String get title;
  @BuiltValueField(wireName: 'authors')
  BuiltList<String> get authors;
  @BuiltValueField(wireName: 'publisher')@nullable
  String get publisher;
  @BuiltValueField(wireName: 'publishedDate')@nullable
  String get publishedDate;
  @BuiltValueField(wireName: 'description')@nullable
  String get description;
  @BuiltValueField(wireName: 'industryIdentifiers')
  BuiltList<IndustryIdentifiers> get industryIdentifiers;
  @BuiltValueField(wireName: 'readingModes')
  ReadingModes get readingModes;
  @BuiltValueField(wireName: 'pageCount')@nullable
  int get pageCount;
  @BuiltValueField(wireName: 'printType')@nullable
  String get printType;
  @BuiltValueField(wireName: 'categories')@nullable
  BuiltList<String> get categories;
  @BuiltValueField(wireName: 'averageRating')@nullable
  double get averageRating;
  @BuiltValueField(wireName: 'ratingsCount')@nullable
  int get ratingsCount;
  @BuiltValueField(wireName: 'maturityRating')@nullable
  String get maturityRating;
  @BuiltValueField(wireName: 'allowAnonLogging')@nullable
  bool get allowAnonLogging;
  @BuiltValueField(wireName: 'contentVersion')@nullable
  String get contentVersion;
  @BuiltValueField(wireName: 'panelizationSummary')
  PanelizationSummary get panelizationSummary;
  @BuiltValueField(wireName: 'imageLinks')
  ImageLinks get imageLinks;
  @BuiltValueField(wireName: 'language')@nullable
  String get language;
  @BuiltValueField(wireName: 'previewLink')@nullable
  String get previewLink;
  @BuiltValueField(wireName: 'infoLink')@nullable
  String get infoLink;
  @BuiltValueField(wireName: 'canonicalVolumeLink')@nullable
  String get canonicalVolumeLink;
  String toJson() {
    return json.encode(serializers.serializeWith(VolumeInfo.serializer, this));
  }

  static VolumeInfo fromJson(String jsonString) {
    return serializers.deserializeWith(
        VolumeInfo.serializer, json.decode(jsonString));
  }

  static Serializer<VolumeInfo> get serializer => _$volumeInfoSerializer;
}


abstract class IndustryIdentifiers
    implements Built<IndustryIdentifiers, IndustryIdentifiersBuilder> {
  IndustryIdentifiers._();

  factory IndustryIdentifiers([updates(IndustryIdentifiersBuilder b)]) =
  _$IndustryIdentifiers;

  @BuiltValueField(wireName: 'type')
  String get type;
  @BuiltValueField(wireName: 'identifier')
  String get identifier;
  String toJson() {
    return json.encode(
        serializers.serializeWith(IndustryIdentifiers.serializer, this));
  }

  static IndustryIdentifiers fromJson(String jsonString) {
    return serializers.deserializeWith(
        IndustryIdentifiers.serializer, json.decode(jsonString));
  }

  static Serializer<IndustryIdentifiers> get serializer =>
      _$industryIdentifiersSerializer;
}


abstract class ReadingModes
    implements Built<ReadingModes, ReadingModesBuilder> {
  ReadingModes._();

  factory ReadingModes([updates(ReadingModesBuilder b)]) = _$ReadingModes;

  @BuiltValueField(wireName: 'text')@nullable
  bool get text;
  @BuiltValueField(wireName: 'image')@nullable
  bool get image;
  String toJson() {
    return json
        .encode(serializers.serializeWith(ReadingModes.serializer, this));
  }

  static ReadingModes fromJson(String jsonString) {
    return serializers.deserializeWith(
        ReadingModes.serializer, json.decode(jsonString));
  }

  static Serializer<ReadingModes> get serializer => _$readingModesSerializer;
}

abstract class PanelizationSummary
    implements Built<PanelizationSummary, PanelizationSummaryBuilder> {
  PanelizationSummary._();

  factory PanelizationSummary([updates(PanelizationSummaryBuilder b)]) =
  _$PanelizationSummary;

  @BuiltValueField(wireName: 'containsEpubBubbles')@nullable
  bool get containsEpubBubbles;
  @BuiltValueField(wireName: 'containsImageBubbles')@nullable
  bool get containsImageBubbles;
  String toJson() {
    return json.encode(
        serializers.serializeWith(PanelizationSummary.serializer, this));
  }

  static PanelizationSummary fromJson(String jsonString) {
    return serializers.deserializeWith(
        PanelizationSummary.serializer, json.decode(jsonString));
  }

  static Serializer<PanelizationSummary> get serializer =>
      _$panelizationSummarySerializer;
}


abstract class ImageLinks implements Built<ImageLinks, ImageLinksBuilder> {
  ImageLinks._();

  factory ImageLinks([updates(ImageLinksBuilder b)]) = _$ImageLinks;

  @BuiltValueField(wireName: 'smallThumbnail')@nullable
  String get smallThumbnail;
  @BuiltValueField(wireName: 'thumbnail')@nullable
  String get thumbnail;
  String toJson() {
    return json.encode(serializers.serializeWith(ImageLinks.serializer, this));
  }

  static ImageLinks fromJson(String jsonString) {
    return serializers.deserializeWith(
        ImageLinks.serializer, json.decode(jsonString));
  }

  static Serializer<ImageLinks> get serializer => _$imageLinksSerializer;
}


abstract class SaleInfo implements Built<SaleInfo, SaleInfoBuilder> {
  SaleInfo._();

  factory SaleInfo([updates(SaleInfoBuilder b)]) = _$SaleInfo;

  @BuiltValueField(wireName: 'country')@nullable
  String get country;
  @BuiltValueField(wireName: 'saleability')@nullable
  String get saleability;
  @BuiltValueField(wireName: 'isEbook')@nullable
  bool get isEbook;
  String toJson() {
    return json.encode(serializers.serializeWith(SaleInfo.serializer, this));
  }

  static SaleInfo fromJson(String jsonString) {
    return serializers.deserializeWith(
        SaleInfo.serializer, json.decode(jsonString));
  }

  static Serializer<SaleInfo> get serializer => _$saleInfoSerializer;
}


abstract class AccessInfo implements Built<AccessInfo, AccessInfoBuilder> {
  AccessInfo._();

  factory AccessInfo([updates(AccessInfoBuilder b)]) = _$AccessInfo;

  @BuiltValueField(wireName: 'country')@nullable
  String get country;
  @BuiltValueField(wireName: 'viewability')@nullable
  String get viewability;
  @BuiltValueField(wireName: 'embeddable')@nullable
  bool get embeddable;
  @BuiltValueField(wireName: 'publicDomain')@nullable
  bool get publicDomain;
  @BuiltValueField(wireName: 'textToSpeechPermission')@nullable
  String get textToSpeechPermission;
  @BuiltValueField(wireName: 'epub')
  Epub get epub;
  @BuiltValueField(wireName: 'pdf')
  Pdf get pdf;
  @BuiltValueField(wireName: 'webReaderLink')@nullable
  String get webReaderLink;
  @BuiltValueField(wireName: 'accessViewStatus')@nullable
  String get accessViewStatus;
  @BuiltValueField(wireName: 'quoteSharingAllowed')@nullable
  bool get quoteSharingAllowed;
  String toJson() {
    return json.encode(serializers.serializeWith(AccessInfo.serializer, this));
  }

  static AccessInfo fromJson(String jsonString) {
    return serializers.deserializeWith(
        AccessInfo.serializer, json.decode(jsonString));
  }

  static Serializer<AccessInfo> get serializer => _$accessInfoSerializer;
}


abstract class Epub implements Built<Epub, EpubBuilder> {
  Epub._();

  factory Epub([updates(EpubBuilder b)]) = _$Epub;

  @BuiltValueField(wireName: 'isAvailable')@nullable
  bool get isAvailable;
  String toJson() {
    return json.encode(serializers.serializeWith(Epub.serializer, this));
  }

  static Epub fromJson(String jsonString) {
    return serializers.deserializeWith(
        Epub.serializer, json.decode(jsonString));
  }

  static Serializer<Epub> get serializer => _$epubSerializer;
}


abstract class Pdf implements Built<Pdf, PdfBuilder> {
  Pdf._();

  factory Pdf([updates(PdfBuilder b)]) = _$Pdf;

  @BuiltValueField(wireName: 'isAvailable')@nullable
  bool get isAvailable;
  @BuiltValueField(wireName: 'acsTokenLink')@nullable
  String get acsTokenLink;
  String toJson() {
    return json.encode(serializers.serializeWith(Pdf.serializer, this));
  }

  static Pdf fromJson(String jsonString) {
    return serializers.deserializeWith(Pdf.serializer, json.decode(jsonString));
  }

  static Serializer<Pdf> get serializer => _$pdfSerializer;
}


abstract class SearchInfo implements Built<SearchInfo, SearchInfoBuilder> {
  SearchInfo._();

  factory SearchInfo([updates(SearchInfoBuilder b)]) = _$SearchInfo;

  @BuiltValueField(wireName: 'textSnippet')@nullable
  String get textSnippet;
  String toJson() {
    return json.encode(serializers.serializeWith(SearchInfo.serializer, this));
  }

  static SearchInfo fromJson(String jsonString) {
    return serializers.deserializeWith(
        SearchInfo.serializer, json.decode(jsonString));
  }

  static Serializer<SearchInfo> get serializer => _$searchInfoSerializer;
}


