import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:saiyo_pets/core/error/exceptions.dart';
import 'package:saiyo_pets/core/network/network.dart';

@LazySingleton(as: INetwork)
class NetworkImpl implements INetwork {
  late Dio _dioClient;

  NetworkImpl() {
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
      throw NetworkException(e.message);
    } catch (e) {
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
      throw NetworkException(e.message);
    } catch (e) {
      rethrow;
    }
  }
}
