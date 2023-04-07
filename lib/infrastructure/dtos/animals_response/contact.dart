import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'address.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact extends Equatable {
  final String? email;
  final String? phone;
  final Address? address;

  const Contact({this.email, this.phone, this.address});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return _$ContactFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContactToJson(this);

  @override
  List<Object?> get props => [email, phone, address];
}
