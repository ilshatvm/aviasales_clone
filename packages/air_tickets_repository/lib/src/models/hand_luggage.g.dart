// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hand_luggage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HandLuggage _$HandLuggageFromJson(Map<String, dynamic> json) => HandLuggage(
      hasHandLuggage: json['has_hand_luggage'] as bool,
      size: json['size'] as String?,
    );

Map<String, dynamic> _$HandLuggageToJson(HandLuggage instance) =>
    <String, dynamic>{
      'has_hand_luggage': instance.hasHandLuggage,
      'size': instance.size,
    };
