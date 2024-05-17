import 'package:json_annotation/json_annotation.dart';

import 'arrival.dart';
import 'hand_luggage.dart';
import 'luggage.dart';
import 'price.dart';

part 'ticket.g.dart';

@JsonSerializable()
class Ticket {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "badge")
  String badge;
  @JsonKey(name: "price")
  Price price;
  @JsonKey(name: "provider_name")
  String providerName;
  @JsonKey(name: "company")
  String company;
  @JsonKey(name: "departure")
  Arrival departure;
  @JsonKey(name: "arrival")
  Arrival arrival;
  @JsonKey(name: "has_transfer")
  bool hasTransfer;
  @JsonKey(name: "has_visa_transfer")
  bool hasVisaTransfer;
  @JsonKey(name: "luggage")
  Luggage luggage;
  @JsonKey(name: "hand_luggage")
  HandLuggage handLuggage;
  @JsonKey(name: "is_returnable")
  bool isReturnable;
  @JsonKey(name: "is_exchangable")
  bool isExchangable;

  Ticket({
    required this.id,
    required this.badge,
    required this.price,
    required this.providerName,
    required this.company,
    required this.departure,
    required this.arrival,
    required this.hasTransfer,
    required this.hasVisaTransfer,
    required this.luggage,
    required this.handLuggage,
    required this.isReturnable,
    required this.isExchangable,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  Map<String, dynamic> toJson() => _$TicketToJson(this);
}
