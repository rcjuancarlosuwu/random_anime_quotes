import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote.freezed.dart';
part 'quote.g.dart';

@freezed
class Quote with _$Quote {
  const factory Quote(int id, String anime, String quote, String said,
      [@Default(false) bool liked]) = _Quote;

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);
}
