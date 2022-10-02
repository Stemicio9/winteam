// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers


//

const url_base = "http://192.168.1.89:8081";

UserListApiService userListApiService = UserListApiService(Dio(),baseUrl: url_base);

class _UserListApiService implements UserListApiService {
  _UserListApiService(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;


  @override
  Future<HttpResponse<dynamic>> getUserList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    var token = await FirebaseAuth.instance.currentUser!.getIdToken();
    final _headers = <String, dynamic>{
      "w1ntoken" : token
    };
    final _data = <String, dynamic>{};

    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/user/list/all',
            queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<dynamic>> me() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    var token = await FirebaseAuth.instance.currentUser!.getIdToken();
    final _headers = <String, dynamic>{
      "w1ntoken" : token
    };
    final _data = <String, dynamic>{};

    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/user/me',
            queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }



  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }




}
