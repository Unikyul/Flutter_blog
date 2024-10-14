import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDate(String date) {
  DateTime dt = DateTime.parse(date);
  return DateFormat("yyyy-MM-dd").format(dt);
}

//navigatorkey는 앱에 떠있는 페이지를 추적할 수 있게 해준다.
final navigatorKey = GlobalKey<NavigatorState>();

final dio = Dio(
  BaseOptions(
    baseUrl: "http://192.168.0.152:8080", // 서버 IP:PORT 입력
    contentType: "application/json; charset=utf-8",
  ),
);
