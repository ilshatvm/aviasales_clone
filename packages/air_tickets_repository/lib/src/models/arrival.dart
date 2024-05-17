import 'package:json_annotation/json_annotation.dart';

part 'arrival.g.dart';

@JsonSerializable()
class Arrival {
  @JsonKey(name: "town")
  String town;
  @JsonKey(name: "date")
  DateTime date;
  @JsonKey(name: "airport")
  String airport;

  Arrival({
    required this.town,
    required this.date,
    required this.airport,
  });

  factory Arrival.fromJson(Map<String, dynamic> json) =>
      _$ArrivalFromJson(json);

  Map<String, dynamic> toJson() => _$ArrivalToJson(this);
}
