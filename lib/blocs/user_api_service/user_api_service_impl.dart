part of 'user_api_service.dart';





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

    print("BASE URL");
    print(_dio.options.baseUrl);

    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/user/me',
            queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }


  @override
  Future<HttpResponse<dynamic>> getUser(String uid) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    var token = await FirebaseAuth.instance.currentUser!.getIdToken();
    final _headers = <String, dynamic>{
      "w1ntoken" : token
    };
    final _data = <String, dynamic>{};

    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/user/list/$uid',
            queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<dynamic>> register(String role) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      "role" : role
    };
    var token = await FirebaseAuth.instance.currentUser!.getIdToken();
    final _headers = <String, dynamic>{
      "w1ntoken" : token
    };
    final _data = <String, dynamic>{};

    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/user/register',
            queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }


   @override
   Future<HttpResponse<dynamic>> fetchUsers(Filter filters) async {
     const _extra = <String, dynamic>{};
     final queryParameters = filters.toQueryParameters();
     var token = await FirebaseAuth.instance.currentUser!.getIdToken();
     final _headers = <String, dynamic>{
       "w1ntoken" : token
     };
     final _data = <String, dynamic>{};

     final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
         Options(method: 'GET', headers: _headers, extra: _extra)
             .compose(_dio.options, '/user/page',
             queryParameters: queryParameters, data: _data)
             .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
     final value = _result.data;
     final httpResponse = HttpResponse(value, _result);
     return httpResponse;
  }

  @override
  Future<HttpResponse> canI(String query) async{
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      "what" : query
    };
    var token = await FirebaseAuth.instance.currentUser!.getIdToken();
    final _headers = <String, dynamic>{
      "w1ntoken" : token
    };
    final _data = <String, dynamic>{};

    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/user/cani',
            queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse> updateUser(UserEntity userEntity) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    var token = await FirebaseAuth.instance.currentUser!.getIdToken();
    final _headers = <String, dynamic>{
      "w1ntoken" : token
    };
    final _data = userEntity.toJson();

    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/user/update',
            queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse> mySubscription(String uid) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    var token = await FirebaseAuth.instance.currentUser!.getIdToken();
    final _headers = <String, dynamic>{
      "w1ntoken" : token
    };
    final _data = {
     "id" : uid
     };

    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/user/mysubscription',
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
