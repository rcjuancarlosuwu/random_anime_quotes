// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Quote _$$_QuoteFromJson(Map<String, dynamic> json) => _$_Quote(
      json['_id'] as int,
      json['anime'] as String,
      json['quote'] as String,
      json['said'] as String,
      json['liked'] as bool? ?? false,
    );

Map<String, dynamic> _$$_QuoteToJson(_$_Quote instance) => <String, dynamic>{
      '_id': instance.id,
      'anime': instance.anime,
      'quote': instance.quote,
      'said': instance.said,
      'liked': instance.liked,
    };
