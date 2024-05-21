import 'package:json_annotation/json_annotation.dart';

import 'ticket.dart';

part 'tickets.g.dart';

@JsonSerializable()
class Tickets {
  @JsonKey(name: "tickets")
  final List<Ticket>? tickets;

  Tickets({
    this.tickets,
  });

  factory Tickets.fromJson(Map<String, dynamic> json) =>
      _$TicketsFromJson(json);

  Map<String, dynamic> toJson() => _$TicketsToJson(this);
}
