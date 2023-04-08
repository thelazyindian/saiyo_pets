import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:saiyo_pets/domain/entities/animals/address.dart';

part 'address.g.dart';

@JsonSerializable()
class AddressDto extends Equatable {
  final String? address1;
  final String? address2;
  final String? city;
  final String? state;
  final String? postcode;
  final String? country;

  const AddressDto({
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postcode,
    this.country,
  });

  factory AddressDto.fromJson(Map<String, dynamic> json) {
    return _$AddressDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddressDtoToJson(this);

  Address toDomain() {
    return Address(
      address1: address1,
      address2: address2,
      city: city,
      state: state,
      postcode: postcode,
      country: country,
    );
  }

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
