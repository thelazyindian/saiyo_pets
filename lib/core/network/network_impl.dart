import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:saiyo_pets/core/error/exceptions.dart';
import 'package:saiyo_pets/core/network/network.dart';

@LazySingleton(as: INetwork)
class NetworkImpl implements INetwork {
  late Dio _dioClient;

  @preResolve
  void init() {
    _dioClient = Dio();
  }

  @override
  Future get({
    required String baseUri,
    String? path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dioClient.get(
        baseUri + (path ?? ''),
        queryParameters: query,
        options: Options(headers: headers),
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
  Future post({
    required String baseUri,
    String? path,
    Object? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dioClient.post(
        baseUri + (path ?? ''),
        data: data,
        queryParameters: query,
        options: Options(headers: headers),
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
