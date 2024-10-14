import 'package:blog/ui/components/custom_appbar.dart';
import 'package:blog/ui/write/components/post_write_body.dart';
import 'package:flutter/material.dart';

class PostWritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Post Write Page"),
      body: PostWriteBody(),
    );
  }
}
