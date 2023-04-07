import 'package:equatable/equatable.dart';

import 'address.dart';

class Contact extends Equatable {
  final String? email;
  final String? phone;
  final Address? address;

  const Contact({this.email, this.phone, this.address});

  @override
  List<Object?> get props => [email, phone, address];
}
