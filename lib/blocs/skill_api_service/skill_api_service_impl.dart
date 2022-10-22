part of 'skill_api_service.dart';


const url_base = "http://192.168.1.89:8081";
//const url_base = "http://192.168.1.74:8081";


SkillListApiService skillListApiService = SkillListApiService(Dio(),baseUrl: url_base);

class _SkillListApiService implements SkillListApiService {
  _SkillListApiService(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;


  @override
  Future<HttpResponse<dynamic>> getSkillListByFilter(Filter filters) async {
    const _extra = <String, dynamic>{};
    final queryParameters = filters.toQueryParameters();
    var token = await FirebaseAuth.instance.currentUser!.getIdToken();
    final _headers = <String, dynamic>{
      "w1ntoken" : token
    };
    final _data = <String, dynamic>{};

    final _result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/skill/list/filter',
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