// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(AccessInfo.serializer)
      ..add(AllBooks.serializer)
      ..add(Book.serializer)
      ..add(Epub.serializer)
      ..add(ImageLinks.serializer)
      ..add(IndustryIdentifiers.serializer)
      ..add(PanelizationSummary.serializer)
      ..add(Pdf.serializer)
      ..add(ReadingModes.serializer)
      ..add(SaleInfo.serializer)
      ..add(SearchInfo.serializer)
      ..add(VolumeInfo.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Book)]),
          () => new ListBuilder<Book>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(IndustryIdentifiers)]),
          () => new ListBuilder<IndustryIdentifiers>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>()))
    .build();

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
