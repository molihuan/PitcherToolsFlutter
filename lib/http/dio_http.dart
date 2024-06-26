import 'package:dio/dio.dart';

class DioHttp {
  static final DioHttp _instance = DioHttp._internal();

  factory DioHttp() => _instance;

  DioHttp._internal() {
    _initInterceptors(); // 初始化拦截器
  }

  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        'Content-Type': 'application/json;charset=UTF-8',
        // 添加默认的请求头，如'Authorization'
      },
      baseUrl: "http://xiaomoli.eu.org",
    ),
  );

  final Dio _commonDio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        'Content-Type': 'application/json;charset=UTF-8',
      },
    ),
  );

  // 初始化拦截器
  void _initInterceptors() {
    // 添加日志拦截器
    _dio.interceptors.add(LogInterceptor(responseBody: false));

    // 可以添加更多拦截器，比如处理token刷新、错误统一处理等
  }

  // 设置请求头
  static void setDefaultHeader(String key, String value) {
    _instance._dio.options.headers[key] = value;
  }

  // GET请求
  static Future<dynamic> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response =
          await _instance._dio.get(url, queryParameters: queryParameters);
      return _instance._handleResponse(response);
    } on DioException catch (e) {
      return _instance._handleError(e);
    }
  }

  // POST请求
  static Future<dynamic> post(String url, dynamic data) async {
    try {
      Response response = await _instance._dio.post(url, data: data);
      return _instance._handleResponse(response);
    } on DioException catch (e) {
      return _instance._handleError(e);
    }
  }

  // PUT请求
  static Future<dynamic> put(String url, dynamic data) async {
    try {
      Response response = await _instance._dio.put(url, data: data);
      return _instance._handleResponse(response);
    } on DioException catch (e) {
      return _instance._handleError(e);
    }
  }

  // DELETE请求
  static Future<dynamic> delete(String url, dynamic data) async {
    try {
      Response response = await _instance._dio.delete(url, data: data);
      return _instance._handleResponse(response);
    } on DioException catch (e) {
      return _instance._handleError(e);
    }
  }

  // 设置请求头
  static void setcHeader(String key, String value) {
    _instance._commonDio.options.headers[key] = value;
  }

  // GET请求
  static Future<dynamic> cget(String url,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response =
          await _instance._commonDio.get(url, queryParameters: queryParameters);
      return _instance._handleResponse(response);
    } on DioException catch (e) {
      return _instance._handleError(e);
    }
  }

  // POST请求
  static Future<dynamic> cpost(String url, dynamic data) async {
    try {
      Response response = await _instance._commonDio.post(url, data: data);
      return _instance._handleResponse(response);
    } on DioException catch (e) {
      return _instance._handleError(e);
    }
  }

  // PUT请求
  static Future<dynamic> cput(String url, dynamic data) async {
    try {
      Response response = await _instance._commonDio.put(url, data: data);
      return _instance._handleResponse(response);
    } on DioException catch (e) {
      return _instance._handleError(e);
    }
  }

  // DELETE请求
  static Future<dynamic> cdelete(String url, dynamic data) async {
    try {
      Response response = await _instance._commonDio.delete(url, data: data);
      return _instance._handleResponse(response);
    } on DioException catch (e) {
      return _instance._handleError(e);
    }
  }

  // 统一处理响应
  dynamic _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw HttpException(response.statusMessage ?? 'Unknown Error');
    }
  }

  // 统一处理错误
  dynamic _handleError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      throw TimeoutException('Timeout');
    } else {
      throw HttpException(e.message ?? 'Unknown Error');
    }
  }
}

// 自定义异常类
class HttpException implements Exception {
  final String message;

  HttpException(this.message);

  @override
  String toString() => 'HttpException: $message';
}

class TimeoutException extends HttpException {
  TimeoutException(String message) : super(message);
}
