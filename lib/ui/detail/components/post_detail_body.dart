import 'package:blog/ui/detail/post_detail_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailBody extends ConsumerWidget {
  int id;

  PostDetailBody(this.id);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostDetailModel? model = ref.watch(postDetailProvider(id));

    if (model == null) {
      return CircularProgressIndicator();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              child: Icon(CupertinoIcons.trash_fill),
              onPressed: () {},
            ),
          ),
          SizedBox(height: 10),
          Text("id : ${model.id}", style: TextStyle(fontSize: 20)),
          Text("title : ${model.title}"),
          Text("content : ${model.content}"),
          Text("createdAt : ${model.createdAt}"),
          Text("updatedAt:  ${model.updatedAt}")
        ],
      ),
    );
  }
}
