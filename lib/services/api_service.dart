import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dummy_api_call/src/movies_api_model.dart';
import '../src/dummy_api_model.dart';

class ApiService{
  Dio dio = Dio();
  Future<DummyApiModel> apiCall({required url,method,params}) async{
   var res = await dio.get(url);
   return DummyApiModel.fromJson(res.data);
  }
  Future<List<MoviesApiModel>> apiCallForMovies({required url,method,params}) async{
    var res = await dio.get(url);
    print(res.data.runtimeType);
    print("my resp ${jsonEncode(res.data)}");
    print("my respons ${res.data}");
    print(res.data.length);
    List<MoviesApiModel> movieApiModel =[];
    for(int i=0;i<res.data.length;i++){
      movieApiModel.add(MoviesApiModel.fromJson(res.data[i]));
    }
    return movieApiModel;
  }
}