import 'package:blog/core/utils.dart';
import 'package:dio/dio.dart';

class PostRepository {
  // 싱클톤으로 데이터 바인딩 하는법 , get 만들거면 instnace에 _ 붙이고
  //static PostRepository instnace = PostRepository._single();
  //PostRepository._single();

  // 하는일: 통신 후 body 데이터만 응답
  // List<dynamic> or Map<String,dynamic>
  Future<List<dynamic>> findAll() async {
    //1. 통신 -> response [header, body]
    Response response = await dio.get("/api/post");

    //2. body 부분 리턴
    //body 부분이 컬렉션이면 파싱 할 때 List<dynamic>으로 받아드린다.
    //body 부분이 json이면 Map<String,dynamic>으로 받아드린다.
    List<dynamic> resposebody = response.data["body"];

    //list의 map타입
    return resposebody;
  }

  Future<Map<String, dynamic>> findById(int id) async {
    //1. 통신 -> response [header, body]
    Response response = await dio.get("/api/post/$id");

    //2. body 부분 리턴
    //body 부분이 컬렉션이면 파싱 할 때 List<dynamic>으로 받아드린다.
    //body 부분이 json이면 Map<String,dynamic>으로 받아드린다.
    Map<String, dynamic> resposebody = response.data["body"];

    //list의 map타입
    return resposebody;
  }
}
