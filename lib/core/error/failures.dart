import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class IFailure extends Equatable {
  String get message;

  @override
  List<Object> get props => [message];
}

class NetworkFailure extends IFailure {
  @override
  String get message => 'Some network error occurred.';
}

class InternalFailure extends IFailure {
  Object? error;

  InternalFailure(this.error) {
    debugPrint(error.toString());
  }

  @override
  String get message => 'Some internal error occurred.';
}
