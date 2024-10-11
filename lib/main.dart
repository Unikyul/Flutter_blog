import 'package:blog/core/theme.dart';
import 'package:blog/ui/list/post_list_page.dart';
import 'package:blog/ui/write/post_write_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/utils.dart';

void main() {
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: "/",
      //상세보기는 id값이 다르기 때문에 설정을 하지 못한다. (동적이기 때문에)
      routes: {
        "/": (context) => PostListPage(),
        "/write": (context) => PostWritePage(),
      },
    );
  }
}
