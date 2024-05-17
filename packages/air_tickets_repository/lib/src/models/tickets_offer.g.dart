// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tickets_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketsOffer _$TicketsOfferFromJson(Map<String, dynamic> json) => TicketsOffer(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      timeRange: (json['time_range'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      price: Price.fromJson(json['price'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TicketsOfferToJson(TicketsOffer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'time_range': instance.timeRange,
      'price': instance.price,
    };
