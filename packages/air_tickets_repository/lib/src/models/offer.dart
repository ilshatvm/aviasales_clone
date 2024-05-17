import 'package:json_annotation/json_annotation.dart';

import 'price.dart';

part 'offer.g.dart';

@JsonSerializable()
class Offer {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "town")
  String town;
  @JsonKey(name: "price")
  Price price;

  Offer({
    required this.id,
    required this.title,
    required this.town,
    required this.price,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

  Map<String, dynamic> toJson() => _$OfferToJson(this);
}
