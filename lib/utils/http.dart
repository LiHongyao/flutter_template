/// -- 网络请求相关
/// 使用指南：
/// 1. 在启动页调用 Http.setUp();
/// 2. Http.get("https://jsonplaceholder.typicode.com/posts");
/// 3. Http.post("https://jsonplaceholder.typicode.com/posts");

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

abstract class PageInfo {
  late final int pageNo;
  late final int total;
  late final int pages;
}

abstract class BaseResponse<T> {
  late final int code;
  late final T data;
  late final String msg;
  late final PageInfo? pageInfo;
}

const kBaseUrl = 'http://xxx';
const kConnectTimeout = 5000;
const kReceiveTimeout = 3000;

/// dio-http
class Http {
  /// dio instance
  static late Dio _dio;

  /// set dio
  static void setUp() {
    //-- 配置 Dio
    final options = BaseOptions(
      baseUrl: kBaseUrl,
      connectTimeout: kConnectTimeout,
      receiveTimeout: kReceiveTimeout,
      headers: {"Content-Type": "application/json;utf-8"},
    );
    //--  创建 Dio
    _dio = Dio(options);

    //--  拦截器
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          /** 请求拦截 */
          if (options.method == "GET") {
            options.queryParameters["timeStamp"] = DateTime.now();
          }
          options.headers['token'] = 'xxx';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          /** 响应拦截 */
          var resp = response.data;
          if (resp.code == 0) {
            EasyLoading.showToast(resp.msg);
            return handler.next(resp);
          }
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          EasyLoading.showToast("服务器异常~");
          return handler.next(e);
        },
      ),
    );
  }

  static Future get<T>(String path, {Map<String, dynamic>? params}) async {
    final uri = path.startsWith("http") ? path : "$kBaseUrl$path";
    return _dio.get(uri, queryParameters: params ?? params);
  }

  static Future post<T>(String path, {Map<String, dynamic>? data}) async {
    final uri = path.startsWith("http") ? path : "$kBaseUrl$path";
    return _dio.post(uri, data: data ?? {});
  }
}
