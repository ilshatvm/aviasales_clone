// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tickets_offers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketsOffers _$TicketsOffersFromJson(Map<String, dynamic> json) =>
    TicketsOffers(
      ticketsOffers: (json['tickets_offers'] as List<dynamic>)
          .map((e) => TicketsOffer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TicketsOffersToJson(TicketsOffers instance) =>
    <String, dynamic>{
      'tickets_offers': instance.ticketsOffers,
    };
