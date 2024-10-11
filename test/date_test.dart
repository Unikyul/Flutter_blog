import 'dart:convert';

import 'package:intl/intl.dart';

void main() {
  // JSON 형식의 String 데이터 (타임스탬프 포함)
  String jsonString = '{"createdAt": "2024-10-11 09:17:31"}';

  // JSON 데이터를 Map으로 파싱
  Map<String, dynamic> jsonData = jsonDecode(jsonString);

  // createdAt 값을 String에서 DateTime으로 변환
  DateTime parsedDate = DateTime.parse(jsonData['createdAt']);

  // 하루 더하기
  DateTime newDate = parsedDate.add(Duration(days: 1));

  // 날짜만 출력하도록 포맷팅
  String formattedDate = DateFormat('yyyy-MM-dd').format(newDate);

  print(formattedDate); // 결과: 2024-10-12
}
