import 'package:equatable/equatable.dart';

import 'contact.dart';

class Adopter extends Equatable {
  final int? id;
  final String? name;
  final String? adoptedAt;
  final Contact? contact;

  const Adopter({
    this.id,
    this.name,
    this.adoptedAt,
    this.contact,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      adoptedAt,
      contact,
    ];
  }
}
