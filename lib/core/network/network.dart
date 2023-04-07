import 'package:saiyo_pets/core/error/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class INetwork {
  Future get(
    String uri, {
    Map<String, dynamic>? query,
  });

  Future post(
    String uri, {
    Object? data,
    Map<String, dynamic>? query,
  });
}

class NetworkImpl implements INetwork {
  final client = Dio();

  @override
  Future get(
    String uri, {
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await client.get(
        uri,
        queryParameters: query,
      );
      return response;
    } on DioError catch (e) {
      debugPrint('DioError $e');
      throw NetworkException(e.message);
    } catch (e) {
      debugPrint('Error $e');
      rethrow;
    }
  }

  @override
  Future post(
    String uri, {
    Object? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await client.post(
        uri,
        data: data,
        queryParameters: query,
      );
      return response;
    } on DioError catch (e) {
      debugPrint('DioError $e');
      throw NetworkException(e.message);
    } catch (e) {
      debugPrint('Error $e');
      rethrow;
    }
  }
}
