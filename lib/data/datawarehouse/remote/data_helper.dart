import 'package:dio/dio.dart';
import '../../../core/end_points.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 600;
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
    };
    return await dio.get(
      url,
      
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    bool sendAuthToken = false,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
    };
    return await dio.post(
      url,
      data: data,
    );
  }

  static Future<Response> postForm({
    bool doctorVendor=false,
    required String url,
    required FormData data,
    Map<String, dynamic>? query,
    bool sendAuthToken = false,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> patchData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    bool sendAuthToken = false,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
    };
    return await dio.patch(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    bool sendAuthToken = false,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
    };
    return await dio.delete(
      url,
      data: data,
      queryParameters: query,
    );
  }
}