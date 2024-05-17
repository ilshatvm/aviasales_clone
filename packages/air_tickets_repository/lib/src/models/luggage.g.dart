// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'luggage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Luggage _$LuggageFromJson(Map<String, dynamic> json) => Luggage(
      hasLuggage: json['has_luggage'] as bool,
      price: Price.fromJson(json['price'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LuggageToJson(Luggage instance) => <String, dynamic>{
      'has_luggage': instance.hasLuggage,
      'price': instance.price,
    };
