// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Quote _$QuoteFromJson(Map<String, dynamic> json) {
  return _Quote.fromJson(json);
}

/// @nodoc
class _$QuoteTearOff {
  const _$QuoteTearOff();

  _Quote call(int id, String anime, String quote, String said,
      [bool liked = false]) {
    return _Quote(
      id,
      anime,
      quote,
      said,
      liked,
    );
  }

  Quote fromJson(Map<String, Object?> json) {
    return Quote.fromJson(json);
  }
}

/// @nodoc
const $Quote = _$QuoteTearOff();

/// @nodoc
mixin _$Quote {
  int get id => throw _privateConstructorUsedError;
  String get anime => throw _privateConstructorUsedError;
  String get quote => throw _privateConstructorUsedError;
  String get said => throw _privateConstructorUsedError;
  bool get liked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuoteCopyWith<Quote> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteCopyWith<$Res> {
  factory $QuoteCopyWith(Quote value, $Res Function(Quote) then) =
      _$QuoteCopyWithImpl<$Res>;
  $Res call({int id, String anime, String quote, String said, bool liked});
}

/// @nodoc
class _$QuoteCopyWithImpl<$Res> implements $QuoteCopyWith<$Res> {
  _$QuoteCopyWithImpl(this._value, this._then);

  final Quote _value;
  // ignore: unused_field
  final $Res Function(Quote) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? anime = freezed,
    Object? quote = freezed,
    Object? said = freezed,
    Object? liked = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      anime: anime == freezed
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as String,
      quote: quote == freezed
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String,
      said: said == freezed
          ? _value.said
          : said // ignore: cast_nullable_to_non_nullable
              as String,
      liked: liked == freezed
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$QuoteCopyWith<$Res> implements $QuoteCopyWith<$Res> {
  factory _$QuoteCopyWith(_Quote value, $Res Function(_Quote) then) =
      __$QuoteCopyWithImpl<$Res>;
  @override
  $Res call({int id, String anime, String quote, String said, bool liked});
}

/// @nodoc
class __$QuoteCopyWithImpl<$Res> extends _$QuoteCopyWithImpl<$Res>
    implements _$QuoteCopyWith<$Res> {
  __$QuoteCopyWithImpl(_Quote _value, $Res Function(_Quote) _then)
      : super(_value, (v) => _then(v as _Quote));

  @override
  _Quote get _value => super._value as _Quote;

  @override
  $Res call({
    Object? id = freezed,
    Object? anime = freezed,
    Object? quote = freezed,
    Object? said = freezed,
    Object? liked = freezed,
  }) {
    return _then(_Quote(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      anime == freezed
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as String,
      quote == freezed
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String,
      said == freezed
          ? _value.said
          : said // ignore: cast_nullable_to_non_nullable
              as String,
      liked == freezed
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Quote with DiagnosticableTreeMixin implements _Quote {
  const _$_Quote(this.id, this.anime, this.quote, this.said,
      [this.liked = false]);

  factory _$_Quote.fromJson(Map<String, dynamic> json) =>
      _$$_QuoteFromJson(json);

  @override
  final int id;
  @override
  final String anime;
  @override
  final String quote;
  @override
  final String said;
  @JsonKey()
  @override
  final bool liked;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Quote(id: $id, anime: $anime, quote: $quote, said: $said, liked: $liked)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Quote'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('anime', anime))
      ..add(DiagnosticsProperty('quote', quote))
      ..add(DiagnosticsProperty('said', said))
      ..add(DiagnosticsProperty('liked', liked));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Quote &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.anime, anime) &&
            const DeepCollectionEquality().equals(other.quote, quote) &&
            const DeepCollectionEquality().equals(other.said, said) &&
            const DeepCollectionEquality().equals(other.liked, liked));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(anime),
      const DeepCollectionEquality().hash(quote),
      const DeepCollectionEquality().hash(said),
      const DeepCollectionEquality().hash(liked));

  @JsonKey(ignore: true)
  @override
  _$QuoteCopyWith<_Quote> get copyWith =>
      __$QuoteCopyWithImpl<_Quote>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuoteToJson(this);
  }
}

abstract class _Quote implements Quote {
  const factory _Quote(int id, String anime, String quote, String said,
      [bool liked]) = _$_Quote;

  factory _Quote.fromJson(Map<String, dynamic> json) = _$_Quote.fromJson;

  @override
  int get id;
  @override
  String get anime;
  @override
  String get quote;
  @override
  String get said;
  @override
  bool get liked;
  @override
  @JsonKey(ignore: true)
  _$QuoteCopyWith<_Quote> get copyWith => throw _privateConstructorUsedError;
}
