import 'package:dio/dio.dart';

class DioHelper{
  static Dio? dio;

  static init()
  {
    dio=Dio(
      BaseOptions(
        baseUrl:'https://dealmart4.herokuapp.com/api/',
        receiveDataWhenStatusError: true,
        /// طالما عملت هيدرز تحت هلغي اللي هنا لانه كداكدا هيتلغي طالما اتضاف تحت
        // headers: {'Content-Type':'application/json',}
        // headers: {
        //   'Content-Type':'application/json',
        //   'lang':'en',
        // },
      ),
    );
  }

  ///GET DATA
  static Future<Response> getData(
      {required  url ,  Map< String , dynamic> ?query,
        String? token,} ) async
  {
    dio?.options.headers= {
      'Authorization': token??'' ,
      'Accept':'application/json',
    };
    return await dio!.get( url ,queryParameters: query,);
  }
  
  ///POST DATA
  static Future<Response> postData(
      {required  url , Map< String , dynamic>? query,
        required Map< String , dynamic>? data ,
        String? token,
      } ) async
  {
    dio?.options.headers= {
      'Authorization': token??'' ,
      'Accept':'application/json',
    };
    return await dio!.post( url ,queryParameters: query,data:data);
  }

}

