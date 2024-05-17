import 'package:json_annotation/json_annotation.dart';

import 'price.dart';

part 'tickets_offer.g.dart';

@JsonSerializable()
class TicketsOffer {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "time_range")
  List<String> timeRange;
  @JsonKey(name: "price")
  Price price;

  TicketsOffer({
    required this.id,
    required this.title,
    required this.timeRange,
    required this.price,
  });

  factory TicketsOffer.fromJson(Map<String, dynamic> json) =>
      _$TicketsOfferFromJson(json);

  Map<String, dynamic> toJson() => _$TicketsOfferToJson(this);
}
