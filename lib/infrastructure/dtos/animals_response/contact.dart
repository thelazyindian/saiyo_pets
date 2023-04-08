import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:saiyo_pets/domain/entities/animals/contact.dart';

import 'address.dart';

part 'contact.g.dart';

@JsonSerializable()
class ContactDto extends Equatable {
  final String? email;
  final String? phone;
  final AddressDto? address;

  const ContactDto({this.email, this.phone, this.address});

  factory ContactDto.fromJson(Map<String, dynamic> json) {
    return _$ContactDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContactDtoToJson(this);

  Contact toDomain() {
    return Contact(
      email: email,
      phone: phone,
      address: address?.toDomain(),
    );
  }

  @override
  List<Object?> get props => [email, phone, address];
}
