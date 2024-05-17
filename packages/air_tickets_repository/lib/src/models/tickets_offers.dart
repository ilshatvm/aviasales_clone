import 'package:json_annotation/json_annotation.dart';

import 'tickets_offer.dart';

part 'tickets_offers.g.dart';

@JsonSerializable()
class TicketsOffers {
  @JsonKey(name: "tickets_offers")
  List<TicketsOffer> ticketsOffers;

  TicketsOffers({
    required this.ticketsOffers,
  });

  factory TicketsOffers.fromJson(Map<String, dynamic> json) =>
      _$TicketsOffersFromJson(json);

  Map<String, dynamic> toJson() => _$TicketsOffersToJson(this);
}
