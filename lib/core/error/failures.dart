import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class IFailure extends Equatable {
  String get message;

  @override
  List<Object> get props => [message];
}

class NetworkFailure extends IFailure {
  Object? error;

  NetworkFailure(this.error) {
    debugPrint('ERROR: $error');
  }

  @override
  String get message => 'Some network error occurred.';
}

class InternalFailure extends IFailure {
  Object? error;
  StackTrace? trace;

  InternalFailure(this.error, this.trace) {
    debugPrint('ERROR: $error');
    debugPrint('TRACE: $trace');
  }

  @override
  String get message => 'Some internal error occurred.';
}
