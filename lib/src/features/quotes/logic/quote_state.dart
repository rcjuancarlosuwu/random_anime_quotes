import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/quote.dart';

part 'quote_state.freezed.dart';

@freezed
class QuoteState with _$QuoteState {
  const factory QuoteState.data({required Quote quote}) = _Data;

  const factory QuoteState.loading() = _Loading;

  const factory QuoteState.error(String message) = _Error;
}
