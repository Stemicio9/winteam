part of 'annunci_api_service.dart';


const url_base = "http://192.168.1.89:8081";
//const url_base = "http://192.168.1.74:8081";


AnnunciListApiService annunciListApiService = AnnunciListApiService(Dio(),baseUrl: url_base);

class _AnnunciListApiService implements AnnunciListApiService {
  _AnnunciListApiService(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;


  @override
  Future<HttpResponse<dynamic>> getAnnunciList(String query) async {
    const _extra = <String, dynamic>{};
    final queryParameters =  <String, dynamic>{
      "state" : query
    };
    var token = await FirebaseAuth.instance.currentUser!.getIdToken();
    final _headers = <String, dynamic>{
      "w1ntoken" : token
    };
    final _data = <String, dynamic>{};

    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/advertisement/list/owner',
            queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }


  @override
  Future<HttpResponse> getAnnunciPaged(Map<String, dynamic> queryParameters, String state, int page, int size) async {
    const _extra = <String, dynamic>{};
    var token = await FirebaseAuth.instance.currentUser!.getIdToken();

    queryParameters.addAll({
      "state": state
    });
    final _headers = <String, dynamic>{
      "w1ntoken" : token
    };
    final _data = <String, dynamic>{};

    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/advertisement/page',
            queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse> publishAnnuncio(AnnunciEntity annuncio) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    var token = await FirebaseAuth.instance.currentUser!.getIdToken();

    final _headers = <String, dynamic>{
      "w1ntoken" : token
    };
    final _data = annuncio.toJson();

    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/advertisement/create',
            queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<dynamic>> listUserAnnuncio(AnnunciEntity annuncio) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      "id" : annuncio.id
    };
    var token = await FirebaseAuth.instance.currentUser!.getIdToken();

    final _headers = <String, dynamic>{
      "w1ntoken" : token
    };
    final _data = annuncio.toJson();

    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/advertisement/list/users',
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
