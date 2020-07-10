// GENERATED CODE - DO NOT MODIFY BY HAND

part of all_books;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AllBooks> _$allBooksSerializer = new _$AllBooksSerializer();
Serializer<Book> _$bookSerializer = new _$BookSerializer();
Serializer<VolumeInfo> _$volumeInfoSerializer = new _$VolumeInfoSerializer();
Serializer<IndustryIdentifiers> _$industryIdentifiersSerializer =
    new _$IndustryIdentifiersSerializer();
Serializer<ReadingModes> _$readingModesSerializer =
    new _$ReadingModesSerializer();
Serializer<PanelizationSummary> _$panelizationSummarySerializer =
    new _$PanelizationSummarySerializer();
Serializer<ImageLinks> _$imageLinksSerializer = new _$ImageLinksSerializer();
Serializer<SaleInfo> _$saleInfoSerializer = new _$SaleInfoSerializer();
Serializer<AccessInfo> _$accessInfoSerializer = new _$AccessInfoSerializer();
Serializer<Epub> _$epubSerializer = new _$EpubSerializer();
Serializer<Pdf> _$pdfSerializer = new _$PdfSerializer();
Serializer<SearchInfo> _$searchInfoSerializer = new _$SearchInfoSerializer();

class _$AllBooksSerializer implements StructuredSerializer<AllBooks> {
  @override
  final Iterable<Type> types = const [AllBooks, _$AllBooks];
  @override
  final String wireName = 'AllBooks';

  @override
  Iterable<Object> serialize(Serializers serializers, AllBooks object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'items',
      serializers.serialize(object.items,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Book)])),
    ];

    return result;
  }

  @override
  AllBooks deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AllBooksBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'items':
          result.items.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Book)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$BookSerializer implements StructuredSerializer<Book> {
  @override
  final Iterable<Type> types = const [Book, _$Book];
  @override
  final String wireName = 'Book';

  @override
  Iterable<Object> serialize(Serializers serializers, Book object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'kind',
      serializers.serialize(object.kind, specifiedType: const FullType(String)),
      'volumeInfo',
      serializers.serialize(object.volumeInfo,
          specifiedType: const FullType(VolumeInfo)),
      'saleInfo',
      serializers.serialize(object.saleInfo,
          specifiedType: const FullType(SaleInfo)),
      'accessInfo',
      serializers.serialize(object.accessInfo,
          specifiedType: const FullType(AccessInfo)),
      'searchInfo',
      serializers.serialize(object.searchInfo,
          specifiedType: const FullType(SearchInfo)),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.etag != null) {
      result
        ..add('etag')
        ..add(serializers.serialize(object.etag,
            specifiedType: const FullType(String)));
    }
    if (object.selfLink != null) {
      result
        ..add('selfLink')
        ..add(serializers.serialize(object.selfLink,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Book deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BookBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'kind':
          result.kind = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'etag':
          result.etag = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'selfLink':
          result.selfLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'volumeInfo':
          result.volumeInfo.replace(serializers.deserialize(value,
              specifiedType: const FullType(VolumeInfo)) as VolumeInfo);
          break;
        case 'saleInfo':
          result.saleInfo.replace(serializers.deserialize(value,
              specifiedType: const FullType(SaleInfo)) as SaleInfo);
          break;
        case 'accessInfo':
          result.accessInfo.replace(serializers.deserialize(value,
              specifiedType: const FullType(AccessInfo)) as AccessInfo);
          break;
        case 'searchInfo':
          result.searchInfo.replace(serializers.deserialize(value,
              specifiedType: const FullType(SearchInfo)) as SearchInfo);
          break;
      }
    }

    return result.build();
  }
}

class _$VolumeInfoSerializer implements StructuredSerializer<VolumeInfo> {
  @override
  final Iterable<Type> types = const [VolumeInfo, _$VolumeInfo];
  @override
  final String wireName = 'VolumeInfo';

  @override
  Iterable<Object> serialize(Serializers serializers, VolumeInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'authors',
      serializers.serialize(object.authors,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'industryIdentifiers',
      serializers.serialize(object.industryIdentifiers,
          specifiedType: const FullType(
              BuiltList, const [const FullType(IndustryIdentifiers)])),
      'readingModes',
      serializers.serialize(object.readingModes,
          specifiedType: const FullType(ReadingModes)),
      'panelizationSummary',
      serializers.serialize(object.panelizationSummary,
          specifiedType: const FullType(PanelizationSummary)),
      'imageLinks',
      serializers.serialize(object.imageLinks,
          specifiedType: const FullType(ImageLinks)),
    ];
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(String)));
    }
    if (object.publisher != null) {
      result
        ..add('publisher')
        ..add(serializers.serialize(object.publisher,
            specifiedType: const FullType(String)));
    }
    if (object.publishedDate != null) {
      result
        ..add('publishedDate')
        ..add(serializers.serialize(object.publishedDate,
            specifiedType: const FullType(String)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.pageCount != null) {
      result
        ..add('pageCount')
        ..add(serializers.serialize(object.pageCount,
            specifiedType: const FullType(int)));
    }
    if (object.printType != null) {
      result
        ..add('printType')
        ..add(serializers.serialize(object.printType,
            specifiedType: const FullType(String)));
    }
    if (object.categories != null) {
      result
        ..add('categories')
        ..add(serializers.serialize(object.categories,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    if (object.averageRating != null) {
      result
        ..add('averageRating')
        ..add(serializers.serialize(object.averageRating,
            specifiedType: const FullType(double)));
    }
    if (object.ratingsCount != null) {
      result
        ..add('ratingsCount')
        ..add(serializers.serialize(object.ratingsCount,
            specifiedType: const FullType(int)));
    }
    if (object.maturityRating != null) {
      result
        ..add('maturityRating')
        ..add(serializers.serialize(object.maturityRating,
            specifiedType: const FullType(String)));
    }
    if (object.allowAnonLogging != null) {
      result
        ..add('allowAnonLogging')
        ..add(serializers.serialize(object.allowAnonLogging,
            specifiedType: const FullType(bool)));
    }
    if (object.contentVersion != null) {
      result
        ..add('contentVersion')
        ..add(serializers.serialize(object.contentVersion,
            specifiedType: const FullType(String)));
    }
    if (object.language != null) {
      result
        ..add('language')
        ..add(serializers.serialize(object.language,
            specifiedType: const FullType(String)));
    }
    if (object.previewLink != null) {
      result
        ..add('previewLink')
        ..add(serializers.serialize(object.previewLink,
            specifiedType: const FullType(String)));
    }
    if (object.infoLink != null) {
      result
        ..add('infoLink')
        ..add(serializers.serialize(object.infoLink,
            specifiedType: const FullType(String)));
    }
    if (object.canonicalVolumeLink != null) {
      result
        ..add('canonicalVolumeLink')
        ..add(serializers.serialize(object.canonicalVolumeLink,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  VolumeInfo deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VolumeInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'authors':
          result.authors.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'publisher':
          result.publisher = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'publishedDate':
          result.publishedDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'industryIdentifiers':
          result.industryIdentifiers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(IndustryIdentifiers)]))
              as BuiltList<Object>);
          break;
        case 'readingModes':
          result.readingModes.replace(serializers.deserialize(value,
              specifiedType: const FullType(ReadingModes)) as ReadingModes);
          break;
        case 'pageCount':
          result.pageCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'printType':
          result.printType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'categories':
          result.categories.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'averageRating':
          result.averageRating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'ratingsCount':
          result.ratingsCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'maturityRating':
          result.maturityRating = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'allowAnonLogging':
          result.allowAnonLogging = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'contentVersion':
          result.contentVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'panelizationSummary':
          result.panelizationSummary.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PanelizationSummary))
              as PanelizationSummary);
          break;
        case 'imageLinks':
          result.imageLinks.replace(serializers.deserialize(value,
              specifiedType: const FullType(ImageLinks)) as ImageLinks);
          break;
        case 'language':
          result.language = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'previewLink':
          result.previewLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'infoLink':
          result.infoLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'canonicalVolumeLink':
          result.canonicalVolumeLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$IndustryIdentifiersSerializer
    implements StructuredSerializer<IndustryIdentifiers> {
  @override
  final Iterable<Type> types = const [
    IndustryIdentifiers,
    _$IndustryIdentifiers
  ];
  @override
  final String wireName = 'IndustryIdentifiers';

  @override
  Iterable<Object> serialize(
      Serializers serializers, IndustryIdentifiers object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'identifier',
      serializers.serialize(object.identifier,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  IndustryIdentifiers deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IndustryIdentifiersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'identifier':
          result.identifier = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ReadingModesSerializer implements StructuredSerializer<ReadingModes> {
  @override
  final Iterable<Type> types = const [ReadingModes, _$ReadingModes];
  @override
  final String wireName = 'ReadingModes';

  @override
  Iterable<Object> serialize(Serializers serializers, ReadingModes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.text != null) {
      result
        ..add('text')
        ..add(serializers.serialize(object.text,
            specifiedType: const FullType(bool)));
    }
    if (object.image != null) {
      result
        ..add('image')
        ..add(serializers.serialize(object.image,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  ReadingModes deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReadingModesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$PanelizationSummarySerializer
    implements StructuredSerializer<PanelizationSummary> {
  @override
  final Iterable<Type> types = const [
    PanelizationSummary,
    _$PanelizationSummary
  ];
  @override
  final String wireName = 'PanelizationSummary';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PanelizationSummary object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.containsEpubBubbles != null) {
      result
        ..add('containsEpubBubbles')
        ..add(serializers.serialize(object.containsEpubBubbles,
            specifiedType: const FullType(bool)));
    }
    if (object.containsImageBubbles != null) {
      result
        ..add('containsImageBubbles')
        ..add(serializers.serialize(object.containsImageBubbles,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  PanelizationSummary deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PanelizationSummaryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'containsEpubBubbles':
          result.containsEpubBubbles = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'containsImageBubbles':
          result.containsImageBubbles = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$ImageLinksSerializer implements StructuredSerializer<ImageLinks> {
  @override
  final Iterable<Type> types = const [ImageLinks, _$ImageLinks];
  @override
  final String wireName = 'ImageLinks';

  @override
  Iterable<Object> serialize(Serializers serializers, ImageLinks object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.smallThumbnail != null) {
      result
        ..add('smallThumbnail')
        ..add(serializers.serialize(object.smallThumbnail,
            specifiedType: const FullType(String)));
    }
    if (object.thumbnail != null) {
      result
        ..add('thumbnail')
        ..add(serializers.serialize(object.thumbnail,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ImageLinks deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ImageLinksBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'smallThumbnail':
          result.smallThumbnail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'thumbnail':
          result.thumbnail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SaleInfoSerializer implements StructuredSerializer<SaleInfo> {
  @override
  final Iterable<Type> types = const [SaleInfo, _$SaleInfo];
  @override
  final String wireName = 'SaleInfo';

  @override
  Iterable<Object> serialize(Serializers serializers, SaleInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.country != null) {
      result
        ..add('country')
        ..add(serializers.serialize(object.country,
            specifiedType: const FullType(String)));
    }
    if (object.saleability != null) {
      result
        ..add('saleability')
        ..add(serializers.serialize(object.saleability,
            specifiedType: const FullType(String)));
    }
    if (object.isEbook != null) {
      result
        ..add('isEbook')
        ..add(serializers.serialize(object.isEbook,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  SaleInfo deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SaleInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'saleability':
          result.saleability = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isEbook':
          result.isEbook = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$AccessInfoSerializer implements StructuredSerializer<AccessInfo> {
  @override
  final Iterable<Type> types = const [AccessInfo, _$AccessInfo];
  @override
  final String wireName = 'AccessInfo';

  @override
  Iterable<Object> serialize(Serializers serializers, AccessInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'epub',
      serializers.serialize(object.epub, specifiedType: const FullType(Epub)),
      'pdf',
      serializers.serialize(object.pdf, specifiedType: const FullType(Pdf)),
    ];
    if (object.country != null) {
      result
        ..add('country')
        ..add(serializers.serialize(object.country,
            specifiedType: const FullType(String)));
    }
    if (object.viewability != null) {
      result
        ..add('viewability')
        ..add(serializers.serialize(object.viewability,
            specifiedType: const FullType(String)));
    }
    if (object.embeddable != null) {
      result
        ..add('embeddable')
        ..add(serializers.serialize(object.embeddable,
            specifiedType: const FullType(bool)));
    }
    if (object.publicDomain != null) {
      result
        ..add('publicDomain')
        ..add(serializers.serialize(object.publicDomain,
            specifiedType: const FullType(bool)));
    }
    if (object.textToSpeechPermission != null) {
      result
        ..add('textToSpeechPermission')
        ..add(serializers.serialize(object.textToSpeechPermission,
            specifiedType: const FullType(String)));
    }
    if (object.webReaderLink != null) {
      result
        ..add('webReaderLink')
        ..add(serializers.serialize(object.webReaderLink,
            specifiedType: const FullType(String)));
    }
    if (object.accessViewStatus != null) {
      result
        ..add('accessViewStatus')
        ..add(serializers.serialize(object.accessViewStatus,
            specifiedType: const FullType(String)));
    }
    if (object.quoteSharingAllowed != null) {
      result
        ..add('quoteSharingAllowed')
        ..add(serializers.serialize(object.quoteSharingAllowed,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  AccessInfo deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AccessInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'viewability':
          result.viewability = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'embeddable':
          result.embeddable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'publicDomain':
          result.publicDomain = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'textToSpeechPermission':
          result.textToSpeechPermission = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'epub':
          result.epub.replace(serializers.deserialize(value,
              specifiedType: const FullType(Epub)) as Epub);
          break;
        case 'pdf':
          result.pdf.replace(serializers.deserialize(value,
              specifiedType: const FullType(Pdf)) as Pdf);
          break;
        case 'webReaderLink':
          result.webReaderLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'accessViewStatus':
          result.accessViewStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'quoteSharingAllowed':
          result.quoteSharingAllowed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$EpubSerializer implements StructuredSerializer<Epub> {
  @override
  final Iterable<Type> types = const [Epub, _$Epub];
  @override
  final String wireName = 'Epub';

  @override
  Iterable<Object> serialize(Serializers serializers, Epub object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.isAvailable != null) {
      result
        ..add('isAvailable')
        ..add(serializers.serialize(object.isAvailable,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  Epub deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EpubBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'isAvailable':
          result.isAvailable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$PdfSerializer implements StructuredSerializer<Pdf> {
  @override
  final Iterable<Type> types = const [Pdf, _$Pdf];
  @override
  final String wireName = 'Pdf';

  @override
  Iterable<Object> serialize(Serializers serializers, Pdf object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.isAvailable != null) {
      result
        ..add('isAvailable')
        ..add(serializers.serialize(object.isAvailable,
            specifiedType: const FullType(bool)));
    }
    if (object.acsTokenLink != null) {
      result
        ..add('acsTokenLink')
        ..add(serializers.serialize(object.acsTokenLink,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Pdf deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PdfBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'isAvailable':
          result.isAvailable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'acsTokenLink':
          result.acsTokenLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SearchInfoSerializer implements StructuredSerializer<SearchInfo> {
  @override
  final Iterable<Type> types = const [SearchInfo, _$SearchInfo];
  @override
  final String wireName = 'SearchInfo';

  @override
  Iterable<Object> serialize(Serializers serializers, SearchInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.textSnippet != null) {
      result
        ..add('textSnippet')
        ..add(serializers.serialize(object.textSnippet,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SearchInfo deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'textSnippet':
          result.textSnippet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AllBooks extends AllBooks {
  @override
  final BuiltList<Book> items;

  factory _$AllBooks([void Function(AllBooksBuilder) updates]) =>
      (new AllBooksBuilder()..update(updates)).build();

  _$AllBooks._({this.items}) : super._() {
    if (items == null) {
      throw new BuiltValueNullFieldError('AllBooks', 'items');
    }
  }

  @override
  AllBooks rebuild(void Function(AllBooksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AllBooksBuilder toBuilder() => new AllBooksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AllBooks && items == other.items;
  }

  @override
  int get hashCode {
    return $jf($jc(0, items.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AllBooks')..add('items', items))
        .toString();
  }
}

class AllBooksBuilder implements Builder<AllBooks, AllBooksBuilder> {
  _$AllBooks _$v;

  ListBuilder<Book> _items;
  ListBuilder<Book> get items => _$this._items ??= new ListBuilder<Book>();
  set items(ListBuilder<Book> items) => _$this._items = items;

  AllBooksBuilder();

  AllBooksBuilder get _$this {
    if (_$v != null) {
      _items = _$v.items?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AllBooks other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AllBooks;
  }

  @override
  void update(void Function(AllBooksBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AllBooks build() {
    _$AllBooks _$result;
    try {
      _$result = _$v ?? new _$AllBooks._(items: items.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AllBooks', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Book extends Book {
  @override
  final String kind;
  @override
  final String id;
  @override
  final String etag;
  @override
  final String selfLink;
  @override
  final VolumeInfo volumeInfo;
  @override
  final SaleInfo saleInfo;
  @override
  final AccessInfo accessInfo;
  @override
  final SearchInfo searchInfo;

  factory _$Book([void Function(BookBuilder) updates]) =>
      (new BookBuilder()..update(updates)).build();

  _$Book._(
      {this.kind,
      this.id,
      this.etag,
      this.selfLink,
      this.volumeInfo,
      this.saleInfo,
      this.accessInfo,
      this.searchInfo})
      : super._() {
    if (kind == null) {
      throw new BuiltValueNullFieldError('Book', 'kind');
    }
    if (volumeInfo == null) {
      throw new BuiltValueNullFieldError('Book', 'volumeInfo');
    }
    if (saleInfo == null) {
      throw new BuiltValueNullFieldError('Book', 'saleInfo');
    }
    if (accessInfo == null) {
      throw new BuiltValueNullFieldError('Book', 'accessInfo');
    }
    if (searchInfo == null) {
      throw new BuiltValueNullFieldError('Book', 'searchInfo');
    }
  }

  @override
  Book rebuild(void Function(BookBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BookBuilder toBuilder() => new BookBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Book &&
        kind == other.kind &&
        id == other.id &&
        etag == other.etag &&
        selfLink == other.selfLink &&
        volumeInfo == other.volumeInfo &&
        saleInfo == other.saleInfo &&
        accessInfo == other.accessInfo &&
        searchInfo == other.searchInfo;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, kind.hashCode), id.hashCode),
                            etag.hashCode),
                        selfLink.hashCode),
                    volumeInfo.hashCode),
                saleInfo.hashCode),
            accessInfo.hashCode),
        searchInfo.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Book')
          ..add('kind', kind)
          ..add('id', id)
          ..add('etag', etag)
          ..add('selfLink', selfLink)
          ..add('volumeInfo', volumeInfo)
          ..add('saleInfo', saleInfo)
          ..add('accessInfo', accessInfo)
          ..add('searchInfo', searchInfo))
        .toString();
  }
}

class BookBuilder implements Builder<Book, BookBuilder> {
  _$Book _$v;

  String _kind;
  String get kind => _$this._kind;
  set kind(String kind) => _$this._kind = kind;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _etag;
  String get etag => _$this._etag;
  set etag(String etag) => _$this._etag = etag;

  String _selfLink;
  String get selfLink => _$this._selfLink;
  set selfLink(String selfLink) => _$this._selfLink = selfLink;

  VolumeInfoBuilder _volumeInfo;
  VolumeInfoBuilder get volumeInfo =>
      _$this._volumeInfo ??= new VolumeInfoBuilder();
  set volumeInfo(VolumeInfoBuilder volumeInfo) =>
      _$this._volumeInfo = volumeInfo;

  SaleInfoBuilder _saleInfo;
  SaleInfoBuilder get saleInfo => _$this._saleInfo ??= new SaleInfoBuilder();
  set saleInfo(SaleInfoBuilder saleInfo) => _$this._saleInfo = saleInfo;

  AccessInfoBuilder _accessInfo;
  AccessInfoBuilder get accessInfo =>
      _$this._accessInfo ??= new AccessInfoBuilder();
  set accessInfo(AccessInfoBuilder accessInfo) =>
      _$this._accessInfo = accessInfo;

  SearchInfoBuilder _searchInfo;
  SearchInfoBuilder get searchInfo =>
      _$this._searchInfo ??= new SearchInfoBuilder();
  set searchInfo(SearchInfoBuilder searchInfo) =>
      _$this._searchInfo = searchInfo;

  BookBuilder();

  BookBuilder get _$this {
    if (_$v != null) {
      _kind = _$v.kind;
      _id = _$v.id;
      _etag = _$v.etag;
      _selfLink = _$v.selfLink;
      _volumeInfo = _$v.volumeInfo?.toBuilder();
      _saleInfo = _$v.saleInfo?.toBuilder();
      _accessInfo = _$v.accessInfo?.toBuilder();
      _searchInfo = _$v.searchInfo?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Book other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Book;
  }

  @override
  void update(void Function(BookBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Book build() {
    _$Book _$result;
    try {
      _$result = _$v ??
          new _$Book._(
              kind: kind,
              id: id,
              etag: etag,
              selfLink: selfLink,
              volumeInfo: volumeInfo.build(),
              saleInfo: saleInfo.build(),
              accessInfo: accessInfo.build(),
              searchInfo: searchInfo.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'volumeInfo';
        volumeInfo.build();
        _$failedField = 'saleInfo';
        saleInfo.build();
        _$failedField = 'accessInfo';
        accessInfo.build();
        _$failedField = 'searchInfo';
        searchInfo.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Book', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$VolumeInfo extends VolumeInfo {
  @override
  final String title;
  @override
  final BuiltList<String> authors;
  @override
  final String publisher;
  @override
  final String publishedDate;
  @override
  final String description;
  @override
  final BuiltList<IndustryIdentifiers> industryIdentifiers;
  @override
  final ReadingModes readingModes;
  @override
  final int pageCount;
  @override
  final String printType;
  @override
  final BuiltList<String> categories;
  @override
  final double averageRating;
  @override
  final int ratingsCount;
  @override
  final String maturityRating;
  @override
  final bool allowAnonLogging;
  @override
  final String contentVersion;
  @override
  final PanelizationSummary panelizationSummary;
  @override
  final ImageLinks imageLinks;
  @override
  final String language;
  @override
  final String previewLink;
  @override
  final String infoLink;
  @override
  final String canonicalVolumeLink;

  factory _$VolumeInfo([void Function(VolumeInfoBuilder) updates]) =>
      (new VolumeInfoBuilder()..update(updates)).build();

  _$VolumeInfo._(
      {this.title,
      this.authors,
      this.publisher,
      this.publishedDate,
      this.description,
      this.industryIdentifiers,
      this.readingModes,
      this.pageCount,
      this.printType,
      this.categories,
      this.averageRating,
      this.ratingsCount,
      this.maturityRating,
      this.allowAnonLogging,
      this.contentVersion,
      this.panelizationSummary,
      this.imageLinks,
      this.language,
      this.previewLink,
      this.infoLink,
      this.canonicalVolumeLink})
      : super._() {
    if (authors == null) {
      throw new BuiltValueNullFieldError('VolumeInfo', 'authors');
    }
    if (industryIdentifiers == null) {
      throw new BuiltValueNullFieldError('VolumeInfo', 'industryIdentifiers');
    }
    if (readingModes == null) {
      throw new BuiltValueNullFieldError('VolumeInfo', 'readingModes');
    }
    if (panelizationSummary == null) {
      throw new BuiltValueNullFieldError('VolumeInfo', 'panelizationSummary');
    }
    if (imageLinks == null) {
      throw new BuiltValueNullFieldError('VolumeInfo', 'imageLinks');
    }
  }

  @override
  VolumeInfo rebuild(void Function(VolumeInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VolumeInfoBuilder toBuilder() => new VolumeInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VolumeInfo &&
        title == other.title &&
        authors == other.authors &&
        publisher == other.publisher &&
        publishedDate == other.publishedDate &&
        description == other.description &&
        industryIdentifiers == other.industryIdentifiers &&
        readingModes == other.readingModes &&
        pageCount == other.pageCount &&
        printType == other.printType &&
        categories == other.categories &&
        averageRating == other.averageRating &&
        ratingsCount == other.ratingsCount &&
        maturityRating == other.maturityRating &&
        allowAnonLogging == other.allowAnonLogging &&
        contentVersion == other.contentVersion &&
        panelizationSummary == other.panelizationSummary &&
        imageLinks == other.imageLinks &&
        language == other.language &&
        previewLink == other.previewLink &&
        infoLink == other.infoLink &&
        canonicalVolumeLink == other.canonicalVolumeLink;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc(0, title.hashCode), authors.hashCode),
                                                                                publisher.hashCode),
                                                                            publishedDate.hashCode),
                                                                        description.hashCode),
                                                                    industryIdentifiers.hashCode),
                                                                readingModes.hashCode),
                                                            pageCount.hashCode),
                                                        printType.hashCode),
                                                    categories.hashCode),
                                                averageRating.hashCode),
                                            ratingsCount.hashCode),
                                        maturityRating.hashCode),
                                    allowAnonLogging.hashCode),
                                contentVersion.hashCode),
                            panelizationSummary.hashCode),
                        imageLinks.hashCode),
                    language.hashCode),
                previewLink.hashCode),
            infoLink.hashCode),
        canonicalVolumeLink.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VolumeInfo')
          ..add('title', title)
          ..add('authors', authors)
          ..add('publisher', publisher)
          ..add('publishedDate', publishedDate)
          ..add('description', description)
          ..add('industryIdentifiers', industryIdentifiers)
          ..add('readingModes', readingModes)
          ..add('pageCount', pageCount)
          ..add('printType', printType)
          ..add('categories', categories)
          ..add('averageRating', averageRating)
          ..add('ratingsCount', ratingsCount)
          ..add('maturityRating', maturityRating)
          ..add('allowAnonLogging', allowAnonLogging)
          ..add('contentVersion', contentVersion)
          ..add('panelizationSummary', panelizationSummary)
          ..add('imageLinks', imageLinks)
          ..add('language', language)
          ..add('previewLink', previewLink)
          ..add('infoLink', infoLink)
          ..add('canonicalVolumeLink', canonicalVolumeLink))
        .toString();
  }
}

class VolumeInfoBuilder implements Builder<VolumeInfo, VolumeInfoBuilder> {
  _$VolumeInfo _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  ListBuilder<String> _authors;
  ListBuilder<String> get authors =>
      _$this._authors ??= new ListBuilder<String>();
  set authors(ListBuilder<String> authors) => _$this._authors = authors;

  String _publisher;
  String get publisher => _$this._publisher;
  set publisher(String publisher) => _$this._publisher = publisher;

  String _publishedDate;
  String get publishedDate => _$this._publishedDate;
  set publishedDate(String publishedDate) =>
      _$this._publishedDate = publishedDate;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  ListBuilder<IndustryIdentifiers> _industryIdentifiers;
  ListBuilder<IndustryIdentifiers> get industryIdentifiers =>
      _$this._industryIdentifiers ??= new ListBuilder<IndustryIdentifiers>();
  set industryIdentifiers(
          ListBuilder<IndustryIdentifiers> industryIdentifiers) =>
      _$this._industryIdentifiers = industryIdentifiers;

  ReadingModesBuilder _readingModes;
  ReadingModesBuilder get readingModes =>
      _$this._readingModes ??= new ReadingModesBuilder();
  set readingModes(ReadingModesBuilder readingModes) =>
      _$this._readingModes = readingModes;

  int _pageCount;
  int get pageCount => _$this._pageCount;
  set pageCount(int pageCount) => _$this._pageCount = pageCount;

  String _printType;
  String get printType => _$this._printType;
  set printType(String printType) => _$this._printType = printType;

  ListBuilder<String> _categories;
  ListBuilder<String> get categories =>
      _$this._categories ??= new ListBuilder<String>();
  set categories(ListBuilder<String> categories) =>
      _$this._categories = categories;

  double _averageRating;
  double get averageRating => _$this._averageRating;
  set averageRating(double averageRating) =>
      _$this._averageRating = averageRating;

  int _ratingsCount;
  int get ratingsCount => _$this._ratingsCount;
  set ratingsCount(int ratingsCount) => _$this._ratingsCount = ratingsCount;

  String _maturityRating;
  String get maturityRating => _$this._maturityRating;
  set maturityRating(String maturityRating) =>
      _$this._maturityRating = maturityRating;

  bool _allowAnonLogging;
  bool get allowAnonLogging => _$this._allowAnonLogging;
  set allowAnonLogging(bool allowAnonLogging) =>
      _$this._allowAnonLogging = allowAnonLogging;

  String _contentVersion;
  String get contentVersion => _$this._contentVersion;
  set contentVersion(String contentVersion) =>
      _$this._contentVersion = contentVersion;

  PanelizationSummaryBuilder _panelizationSummary;
  PanelizationSummaryBuilder get panelizationSummary =>
      _$this._panelizationSummary ??= new PanelizationSummaryBuilder();
  set panelizationSummary(PanelizationSummaryBuilder panelizationSummary) =>
      _$this._panelizationSummary = panelizationSummary;

  ImageLinksBuilder _imageLinks;
  ImageLinksBuilder get imageLinks =>
      _$this._imageLinks ??= new ImageLinksBuilder();
  set imageLinks(ImageLinksBuilder imageLinks) =>
      _$this._imageLinks = imageLinks;

  String _language;
  String get language => _$this._language;
  set language(String language) => _$this._language = language;

  String _previewLink;
  String get previewLink => _$this._previewLink;
  set previewLink(String previewLink) => _$this._previewLink = previewLink;

  String _infoLink;
  String get infoLink => _$this._infoLink;
  set infoLink(String infoLink) => _$this._infoLink = infoLink;

  String _canonicalVolumeLink;
  String get canonicalVolumeLink => _$this._canonicalVolumeLink;
  set canonicalVolumeLink(String canonicalVolumeLink) =>
      _$this._canonicalVolumeLink = canonicalVolumeLink;

  VolumeInfoBuilder();

  VolumeInfoBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _authors = _$v.authors?.toBuilder();
      _publisher = _$v.publisher;
      _publishedDate = _$v.publishedDate;
      _description = _$v.description;
      _industryIdentifiers = _$v.industryIdentifiers?.toBuilder();
      _readingModes = _$v.readingModes?.toBuilder();
      _pageCount = _$v.pageCount;
      _printType = _$v.printType;
      _categories = _$v.categories?.toBuilder();
      _averageRating = _$v.averageRating;
      _ratingsCount = _$v.ratingsCount;
      _maturityRating = _$v.maturityRating;
      _allowAnonLogging = _$v.allowAnonLogging;
      _contentVersion = _$v.contentVersion;
      _panelizationSummary = _$v.panelizationSummary?.toBuilder();
      _imageLinks = _$v.imageLinks?.toBuilder();
      _language = _$v.language;
      _previewLink = _$v.previewLink;
      _infoLink = _$v.infoLink;
      _canonicalVolumeLink = _$v.canonicalVolumeLink;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VolumeInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$VolumeInfo;
  }

  @override
  void update(void Function(VolumeInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VolumeInfo build() {
    _$VolumeInfo _$result;
    try {
      _$result = _$v ??
          new _$VolumeInfo._(
              title: title,
              authors: authors.build(),
              publisher: publisher,
              publishedDate: publishedDate,
              description: description,
              industryIdentifiers: industryIdentifiers.build(),
              readingModes: readingModes.build(),
              pageCount: pageCount,
              printType: printType,
              categories: _categories?.build(),
              averageRating: averageRating,
              ratingsCount: ratingsCount,
              maturityRating: maturityRating,
              allowAnonLogging: allowAnonLogging,
              contentVersion: contentVersion,
              panelizationSummary: panelizationSummary.build(),
              imageLinks: imageLinks.build(),
              language: language,
              previewLink: previewLink,
              infoLink: infoLink,
              canonicalVolumeLink: canonicalVolumeLink);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'authors';
        authors.build();

        _$failedField = 'industryIdentifiers';
        industryIdentifiers.build();
        _$failedField = 'readingModes';
        readingModes.build();

        _$failedField = 'categories';
        _categories?.build();

        _$failedField = 'panelizationSummary';
        panelizationSummary.build();
        _$failedField = 'imageLinks';
        imageLinks.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'VolumeInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$IndustryIdentifiers extends IndustryIdentifiers {
  @override
  final String type;
  @override
  final String identifier;

  factory _$IndustryIdentifiers(
          [void Function(IndustryIdentifiersBuilder) updates]) =>
      (new IndustryIdentifiersBuilder()..update(updates)).build();

  _$IndustryIdentifiers._({this.type, this.identifier}) : super._() {
    if (type == null) {
      throw new BuiltValueNullFieldError('IndustryIdentifiers', 'type');
    }
    if (identifier == null) {
      throw new BuiltValueNullFieldError('IndustryIdentifiers', 'identifier');
    }
  }

  @override
  IndustryIdentifiers rebuild(
          void Function(IndustryIdentifiersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IndustryIdentifiersBuilder toBuilder() =>
      new IndustryIdentifiersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IndustryIdentifiers &&
        type == other.type &&
        identifier == other.identifier;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, type.hashCode), identifier.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('IndustryIdentifiers')
          ..add('type', type)
          ..add('identifier', identifier))
        .toString();
  }
}

class IndustryIdentifiersBuilder
    implements Builder<IndustryIdentifiers, IndustryIdentifiersBuilder> {
  _$IndustryIdentifiers _$v;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _identifier;
  String get identifier => _$this._identifier;
  set identifier(String identifier) => _$this._identifier = identifier;

  IndustryIdentifiersBuilder();

  IndustryIdentifiersBuilder get _$this {
    if (_$v != null) {
      _type = _$v.type;
      _identifier = _$v.identifier;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IndustryIdentifiers other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$IndustryIdentifiers;
  }

  @override
  void update(void Function(IndustryIdentifiersBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$IndustryIdentifiers build() {
    final _$result =
        _$v ?? new _$IndustryIdentifiers._(type: type, identifier: identifier);
    replace(_$result);
    return _$result;
  }
}

class _$ReadingModes extends ReadingModes {
  @override
  final bool text;
  @override
  final bool image;

  factory _$ReadingModes([void Function(ReadingModesBuilder) updates]) =>
      (new ReadingModesBuilder()..update(updates)).build();

  _$ReadingModes._({this.text, this.image}) : super._();

  @override
  ReadingModes rebuild(void Function(ReadingModesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReadingModesBuilder toBuilder() => new ReadingModesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReadingModes && text == other.text && image == other.image;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, text.hashCode), image.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ReadingModes')
          ..add('text', text)
          ..add('image', image))
        .toString();
  }
}

class ReadingModesBuilder
    implements Builder<ReadingModes, ReadingModesBuilder> {
  _$ReadingModes _$v;

  bool _text;
  bool get text => _$this._text;
  set text(bool text) => _$this._text = text;

  bool _image;
  bool get image => _$this._image;
  set image(bool image) => _$this._image = image;

  ReadingModesBuilder();

  ReadingModesBuilder get _$this {
    if (_$v != null) {
      _text = _$v.text;
      _image = _$v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReadingModes other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ReadingModes;
  }

  @override
  void update(void Function(ReadingModesBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ReadingModes build() {
    final _$result = _$v ?? new _$ReadingModes._(text: text, image: image);
    replace(_$result);
    return _$result;
  }
}

class _$PanelizationSummary extends PanelizationSummary {
  @override
  final bool containsEpubBubbles;
  @override
  final bool containsImageBubbles;

  factory _$PanelizationSummary(
          [void Function(PanelizationSummaryBuilder) updates]) =>
      (new PanelizationSummaryBuilder()..update(updates)).build();

  _$PanelizationSummary._({this.containsEpubBubbles, this.containsImageBubbles})
      : super._();

  @override
  PanelizationSummary rebuild(
          void Function(PanelizationSummaryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PanelizationSummaryBuilder toBuilder() =>
      new PanelizationSummaryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PanelizationSummary &&
        containsEpubBubbles == other.containsEpubBubbles &&
        containsImageBubbles == other.containsImageBubbles;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(0, containsEpubBubbles.hashCode), containsImageBubbles.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PanelizationSummary')
          ..add('containsEpubBubbles', containsEpubBubbles)
          ..add('containsImageBubbles', containsImageBubbles))
        .toString();
  }
}

class PanelizationSummaryBuilder
    implements Builder<PanelizationSummary, PanelizationSummaryBuilder> {
  _$PanelizationSummary _$v;

  bool _containsEpubBubbles;
  bool get containsEpubBubbles => _$this._containsEpubBubbles;
  set containsEpubBubbles(bool containsEpubBubbles) =>
      _$this._containsEpubBubbles = containsEpubBubbles;

  bool _containsImageBubbles;
  bool get containsImageBubbles => _$this._containsImageBubbles;
  set containsImageBubbles(bool containsImageBubbles) =>
      _$this._containsImageBubbles = containsImageBubbles;

  PanelizationSummaryBuilder();

  PanelizationSummaryBuilder get _$this {
    if (_$v != null) {
      _containsEpubBubbles = _$v.containsEpubBubbles;
      _containsImageBubbles = _$v.containsImageBubbles;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PanelizationSummary other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PanelizationSummary;
  }

  @override
  void update(void Function(PanelizationSummaryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PanelizationSummary build() {
    final _$result = _$v ??
        new _$PanelizationSummary._(
            containsEpubBubbles: containsEpubBubbles,
            containsImageBubbles: containsImageBubbles);
    replace(_$result);
    return _$result;
  }
}

class _$ImageLinks extends ImageLinks {
  @override
  final String smallThumbnail;
  @override
  final String thumbnail;

  factory _$ImageLinks([void Function(ImageLinksBuilder) updates]) =>
      (new ImageLinksBuilder()..update(updates)).build();

  _$ImageLinks._({this.smallThumbnail, this.thumbnail}) : super._();

  @override
  ImageLinks rebuild(void Function(ImageLinksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImageLinksBuilder toBuilder() => new ImageLinksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImageLinks &&
        smallThumbnail == other.smallThumbnail &&
        thumbnail == other.thumbnail;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, smallThumbnail.hashCode), thumbnail.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ImageLinks')
          ..add('smallThumbnail', smallThumbnail)
          ..add('thumbnail', thumbnail))
        .toString();
  }
}

class ImageLinksBuilder implements Builder<ImageLinks, ImageLinksBuilder> {
  _$ImageLinks _$v;

  String _smallThumbnail;
  String get smallThumbnail => _$this._smallThumbnail;
  set smallThumbnail(String smallThumbnail) =>
      _$this._smallThumbnail = smallThumbnail;

  String _thumbnail;
  String get thumbnail => _$this._thumbnail;
  set thumbnail(String thumbnail) => _$this._thumbnail = thumbnail;

  ImageLinksBuilder();

  ImageLinksBuilder get _$this {
    if (_$v != null) {
      _smallThumbnail = _$v.smallThumbnail;
      _thumbnail = _$v.thumbnail;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImageLinks other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ImageLinks;
  }

  @override
  void update(void Function(ImageLinksBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ImageLinks build() {
    final _$result = _$v ??
        new _$ImageLinks._(
            smallThumbnail: smallThumbnail, thumbnail: thumbnail);
    replace(_$result);
    return _$result;
  }
}

class _$SaleInfo extends SaleInfo {
  @override
  final String country;
  @override
  final String saleability;
  @override
  final bool isEbook;

  factory _$SaleInfo([void Function(SaleInfoBuilder) updates]) =>
      (new SaleInfoBuilder()..update(updates)).build();

  _$SaleInfo._({this.country, this.saleability, this.isEbook}) : super._();

  @override
  SaleInfo rebuild(void Function(SaleInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SaleInfoBuilder toBuilder() => new SaleInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SaleInfo &&
        country == other.country &&
        saleability == other.saleability &&
        isEbook == other.isEbook;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, country.hashCode), saleability.hashCode), isEbook.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SaleInfo')
          ..add('country', country)
          ..add('saleability', saleability)
          ..add('isEbook', isEbook))
        .toString();
  }
}

class SaleInfoBuilder implements Builder<SaleInfo, SaleInfoBuilder> {
  _$SaleInfo _$v;

  String _country;
  String get country => _$this._country;
  set country(String country) => _$this._country = country;

  String _saleability;
  String get saleability => _$this._saleability;
  set saleability(String saleability) => _$this._saleability = saleability;

  bool _isEbook;
  bool get isEbook => _$this._isEbook;
  set isEbook(bool isEbook) => _$this._isEbook = isEbook;

  SaleInfoBuilder();

  SaleInfoBuilder get _$this {
    if (_$v != null) {
      _country = _$v.country;
      _saleability = _$v.saleability;
      _isEbook = _$v.isEbook;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SaleInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SaleInfo;
  }

  @override
  void update(void Function(SaleInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SaleInfo build() {
    final _$result = _$v ??
        new _$SaleInfo._(
            country: country, saleability: saleability, isEbook: isEbook);
    replace(_$result);
    return _$result;
  }
}

class _$AccessInfo extends AccessInfo {
  @override
  final String country;
  @override
  final String viewability;
  @override
  final bool embeddable;
  @override
  final bool publicDomain;
  @override
  final String textToSpeechPermission;
  @override
  final Epub epub;
  @override
  final Pdf pdf;
  @override
  final String webReaderLink;
  @override
  final String accessViewStatus;
  @override
  final bool quoteSharingAllowed;

  factory _$AccessInfo([void Function(AccessInfoBuilder) updates]) =>
      (new AccessInfoBuilder()..update(updates)).build();

  _$AccessInfo._(
      {this.country,
      this.viewability,
      this.embeddable,
      this.publicDomain,
      this.textToSpeechPermission,
      this.epub,
      this.pdf,
      this.webReaderLink,
      this.accessViewStatus,
      this.quoteSharingAllowed})
      : super._() {
    if (epub == null) {
      throw new BuiltValueNullFieldError('AccessInfo', 'epub');
    }
    if (pdf == null) {
      throw new BuiltValueNullFieldError('AccessInfo', 'pdf');
    }
  }

  @override
  AccessInfo rebuild(void Function(AccessInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccessInfoBuilder toBuilder() => new AccessInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccessInfo &&
        country == other.country &&
        viewability == other.viewability &&
        embeddable == other.embeddable &&
        publicDomain == other.publicDomain &&
        textToSpeechPermission == other.textToSpeechPermission &&
        epub == other.epub &&
        pdf == other.pdf &&
        webReaderLink == other.webReaderLink &&
        accessViewStatus == other.accessViewStatus &&
        quoteSharingAllowed == other.quoteSharingAllowed;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, country.hashCode),
                                        viewability.hashCode),
                                    embeddable.hashCode),
                                publicDomain.hashCode),
                            textToSpeechPermission.hashCode),
                        epub.hashCode),
                    pdf.hashCode),
                webReaderLink.hashCode),
            accessViewStatus.hashCode),
        quoteSharingAllowed.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AccessInfo')
          ..add('country', country)
          ..add('viewability', viewability)
          ..add('embeddable', embeddable)
          ..add('publicDomain', publicDomain)
          ..add('textToSpeechPermission', textToSpeechPermission)
          ..add('epub', epub)
          ..add('pdf', pdf)
          ..add('webReaderLink', webReaderLink)
          ..add('accessViewStatus', accessViewStatus)
          ..add('quoteSharingAllowed', quoteSharingAllowed))
        .toString();
  }
}

class AccessInfoBuilder implements Builder<AccessInfo, AccessInfoBuilder> {
  _$AccessInfo _$v;

  String _country;
  String get country => _$this._country;
  set country(String country) => _$this._country = country;

  String _viewability;
  String get viewability => _$this._viewability;
  set viewability(String viewability) => _$this._viewability = viewability;

  bool _embeddable;
  bool get embeddable => _$this._embeddable;
  set embeddable(bool embeddable) => _$this._embeddable = embeddable;

  bool _publicDomain;
  bool get publicDomain => _$this._publicDomain;
  set publicDomain(bool publicDomain) => _$this._publicDomain = publicDomain;

  String _textToSpeechPermission;
  String get textToSpeechPermission => _$this._textToSpeechPermission;
  set textToSpeechPermission(String textToSpeechPermission) =>
      _$this._textToSpeechPermission = textToSpeechPermission;

  EpubBuilder _epub;
  EpubBuilder get epub => _$this._epub ??= new EpubBuilder();
  set epub(EpubBuilder epub) => _$this._epub = epub;

  PdfBuilder _pdf;
  PdfBuilder get pdf => _$this._pdf ??= new PdfBuilder();
  set pdf(PdfBuilder pdf) => _$this._pdf = pdf;

  String _webReaderLink;
  String get webReaderLink => _$this._webReaderLink;
  set webReaderLink(String webReaderLink) =>
      _$this._webReaderLink = webReaderLink;

  String _accessViewStatus;
  String get accessViewStatus => _$this._accessViewStatus;
  set accessViewStatus(String accessViewStatus) =>
      _$this._accessViewStatus = accessViewStatus;

  bool _quoteSharingAllowed;
  bool get quoteSharingAllowed => _$this._quoteSharingAllowed;
  set quoteSharingAllowed(bool quoteSharingAllowed) =>
      _$this._quoteSharingAllowed = quoteSharingAllowed;

  AccessInfoBuilder();

  AccessInfoBuilder get _$this {
    if (_$v != null) {
      _country = _$v.country;
      _viewability = _$v.viewability;
      _embeddable = _$v.embeddable;
      _publicDomain = _$v.publicDomain;
      _textToSpeechPermission = _$v.textToSpeechPermission;
      _epub = _$v.epub?.toBuilder();
      _pdf = _$v.pdf?.toBuilder();
      _webReaderLink = _$v.webReaderLink;
      _accessViewStatus = _$v.accessViewStatus;
      _quoteSharingAllowed = _$v.quoteSharingAllowed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccessInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AccessInfo;
  }

  @override
  void update(void Function(AccessInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AccessInfo build() {
    _$AccessInfo _$result;
    try {
      _$result = _$v ??
          new _$AccessInfo._(
              country: country,
              viewability: viewability,
              embeddable: embeddable,
              publicDomain: publicDomain,
              textToSpeechPermission: textToSpeechPermission,
              epub: epub.build(),
              pdf: pdf.build(),
              webReaderLink: webReaderLink,
              accessViewStatus: accessViewStatus,
              quoteSharingAllowed: quoteSharingAllowed);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'epub';
        epub.build();
        _$failedField = 'pdf';
        pdf.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AccessInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Epub extends Epub {
  @override
  final bool isAvailable;

  factory _$Epub([void Function(EpubBuilder) updates]) =>
      (new EpubBuilder()..update(updates)).build();

  _$Epub._({this.isAvailable}) : super._();

  @override
  Epub rebuild(void Function(EpubBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EpubBuilder toBuilder() => new EpubBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Epub && isAvailable == other.isAvailable;
  }

  @override
  int get hashCode {
    return $jf($jc(0, isAvailable.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Epub')
          ..add('isAvailable', isAvailable))
        .toString();
  }
}

class EpubBuilder implements Builder<Epub, EpubBuilder> {
  _$Epub _$v;

  bool _isAvailable;
  bool get isAvailable => _$this._isAvailable;
  set isAvailable(bool isAvailable) => _$this._isAvailable = isAvailable;

  EpubBuilder();

  EpubBuilder get _$this {
    if (_$v != null) {
      _isAvailable = _$v.isAvailable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Epub other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Epub;
  }

  @override
  void update(void Function(EpubBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Epub build() {
    final _$result = _$v ?? new _$Epub._(isAvailable: isAvailable);
    replace(_$result);
    return _$result;
  }
}

class _$Pdf extends Pdf {
  @override
  final bool isAvailable;
  @override
  final String acsTokenLink;

  factory _$Pdf([void Function(PdfBuilder) updates]) =>
      (new PdfBuilder()..update(updates)).build();

  _$Pdf._({this.isAvailable, this.acsTokenLink}) : super._();

  @override
  Pdf rebuild(void Function(PdfBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PdfBuilder toBuilder() => new PdfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Pdf &&
        isAvailable == other.isAvailable &&
        acsTokenLink == other.acsTokenLink;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, isAvailable.hashCode), acsTokenLink.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Pdf')
          ..add('isAvailable', isAvailable)
          ..add('acsTokenLink', acsTokenLink))
        .toString();
  }
}

class PdfBuilder implements Builder<Pdf, PdfBuilder> {
  _$Pdf _$v;

  bool _isAvailable;
  bool get isAvailable => _$this._isAvailable;
  set isAvailable(bool isAvailable) => _$this._isAvailable = isAvailable;

  String _acsTokenLink;
  String get acsTokenLink => _$this._acsTokenLink;
  set acsTokenLink(String acsTokenLink) => _$this._acsTokenLink = acsTokenLink;

  PdfBuilder();

  PdfBuilder get _$this {
    if (_$v != null) {
      _isAvailable = _$v.isAvailable;
      _acsTokenLink = _$v.acsTokenLink;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Pdf other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Pdf;
  }

  @override
  void update(void Function(PdfBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Pdf build() {
    final _$result = _$v ??
        new _$Pdf._(isAvailable: isAvailable, acsTokenLink: acsTokenLink);
    replace(_$result);
    return _$result;
  }
}

class _$SearchInfo extends SearchInfo {
  @override
  final String textSnippet;

  factory _$SearchInfo([void Function(SearchInfoBuilder) updates]) =>
      (new SearchInfoBuilder()..update(updates)).build();

  _$SearchInfo._({this.textSnippet}) : super._();

  @override
  SearchInfo rebuild(void Function(SearchInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchInfoBuilder toBuilder() => new SearchInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchInfo && textSnippet == other.textSnippet;
  }

  @override
  int get hashCode {
    return $jf($jc(0, textSnippet.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchInfo')
          ..add('textSnippet', textSnippet))
        .toString();
  }
}

class SearchInfoBuilder implements Builder<SearchInfo, SearchInfoBuilder> {
  _$SearchInfo _$v;

  String _textSnippet;
  String get textSnippet => _$this._textSnippet;
  set textSnippet(String textSnippet) => _$this._textSnippet = textSnippet;

  SearchInfoBuilder();

  SearchInfoBuilder get _$this {
    if (_$v != null) {
      _textSnippet = _$v.textSnippet;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchInfo;
  }

  @override
  void update(void Function(SearchInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchInfo build() {
    final _$result = _$v ?? new _$SearchInfo._(textSnippet: textSnippet);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
