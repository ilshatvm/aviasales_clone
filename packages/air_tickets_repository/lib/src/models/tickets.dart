import 'package:json_annotation/json_annotation.dart';

import 'ticket.dart';

part 'tickets.g.dart';

@JsonSerializable()
class Tickets {
  @JsonKey(name: "tickets")
  List<Ticket> tickets;

  Tickets({
    required this.tickets,
  });

  factory Tickets.fromJson(Map<String, dynamic> json) =>
      _$TicketsFromJson(json);

  Map<String, dynamic> toJson() => _$TicketsToJson(this);
}
