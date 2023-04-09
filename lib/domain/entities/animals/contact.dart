import 'package:equatable/equatable.dart';
import 'package:saiyo_pets/infrastructure/dtos/animals_response/contact.dart';

import 'address.dart';

class Contact extends Equatable {
  final String? email;
  final String? phone;
  final Address? address;

  const Contact({this.email, this.phone, this.address});

  ContactDto toDto() {
    return ContactDto(
      email: email,
      phone: phone,
      address: address?.toDto(),
    );
  }

  @override
  List<Object?> get props => [email, phone, address];
}
