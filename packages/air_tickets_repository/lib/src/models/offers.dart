import 'package:json_annotation/json_annotation.dart';

import 'offer.dart';

part 'offers.g.dart';

@JsonSerializable()
class Offers {
  @JsonKey(name: "offers")
  List<Offer> offers;

  Offers({
    required this.offers,
  });

  factory Offers.fromJson(Map<String, dynamic> json) => _$OffersFromJson(json);

  Map<String, dynamic> toJson() => _$OffersToJson(this);
}
