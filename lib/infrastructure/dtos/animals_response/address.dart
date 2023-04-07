import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address extends Equatable {
  final dynamic address1;
  final dynamic address2;
  final String? city;
  final String? state;
  final String? postcode;
  final String? country;

  const Address({
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postcode,
    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return _$AddressFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  List<Object?> get props {
    return [
      address1,
      address2,
      city,
      state,
      postcode,
      country,
    ];
  }
}
