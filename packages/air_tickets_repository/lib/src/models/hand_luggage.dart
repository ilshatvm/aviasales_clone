import 'package:json_annotation/json_annotation.dart';

part 'hand_luggage.g.dart';

@JsonSerializable()
class HandLuggage {
  @JsonKey(name: "has_hand_luggage")
  bool hasHandLuggage;
  @JsonKey(name: "size")
  String? size;

  HandLuggage({
    required this.hasHandLuggage,
    required this.size,
  });

  factory HandLuggage.fromJson(Map<String, dynamic> json) =>
      _$HandLuggageFromJson(json);

  Map<String, dynamic> toJson() => _$HandLuggageToJson(this);
}
