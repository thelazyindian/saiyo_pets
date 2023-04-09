import 'package:equatable/equatable.dart';
import 'package:saiyo_pets/infrastructure/dtos/animals_response/address.dart';

class Address extends Equatable {
  final String? address1;
  final String? address2;
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

  AddressDto toDto() {
    return AddressDto(
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
