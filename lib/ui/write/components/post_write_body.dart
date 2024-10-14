import 'package:blog/ui/list/post_list_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostWriteBody extends ConsumerWidget {
  final _title = TextEditingController();
  final _content = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: ListView(
              shrinkWrap: true, //확장했다.
              children: [
                Container(
                  color: Colors.deepPurple[100],
                  height: 400,
                  width: double.infinity,
                  child: Icon(CupertinoIcons.airplane),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _title,
                ),
                TextFormField(
                  controller: _content,
                ),
                //  Checkbox(
                //    value: true,
                //    onChanged: (value) {
                //      print(value);
                //    },
                // ),
              ],
            ),
          ),

          // TextButton을 children 리스트에 포함시킴
          TextButton(
              onPressed: () {
                ref
                    .read(postListProvider.notifier)
                    .notifySave(_title.text, _content.text);
                //여기세 네비게이션 pop을 쓰면 위험하다.. 화면이 먼저 팝 될수있다.
                //Navigator.pop(context);
                //창고에 통신 코드가 있는데 비동기로 돌고있는데 네이게이션팝을 하면 창고가 무너진다.
                //하나의 비즈니스 로직은 트렉젝션으로 묶어주는 게 좋다.
                // 방법이 2가지 있다. 1. async , awiat 걸어주기
                // 2.  notifySave에서 save와 post list vm에서 화면받는 걸 만들어준다
              },
              child: Text("글쓰기")),
        ],
      ),
    );
  }
}
