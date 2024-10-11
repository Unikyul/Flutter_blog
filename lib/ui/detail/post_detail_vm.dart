//1. 창고(View)
import 'package:blog/core/utils.dart';
import 'package:blog/data/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailVM extends StateNotifier<PostDetailModel?> {
  PostDetailVM(super.state);

  //notifyinit 해서 데이터 받고? family데이터 받기
  Future<void> notifyInit(int id) async {
    Map<String, dynamic> one = await PostRepository().findById(id);
    //객체 만들어서 상태를 new해서 다시 만들어준다.
    state = PostDetailModel.fromMap(one);
  }
}

//2. 창고 데이터(State) DTO 같은거다! //내부 데이터 필요하면 _클래스 만들다.
//통신해서 받아야 할 데이터
class PostDetailModel {
  int id;
  String title;
  String content;
  String createdAt;
  String updatedAt;

  PostDetailModel.fromMap(map)
      : this.id = map["id"],
        this.title = map["title"],
        this.content = map["content"],
        this.createdAt = formatDate(map["createdAt"]),
        this.updatedAt = formatDate(map["updatedAt"]);
}

//3. 창고 관리자 (Provider)
final postDetailProvider =
//이름이 있는 생성자(family) ,타입을 적고 id를 넣으면 된다.
    StateNotifierProvider.autoDispose
        .family<PostDetailVM, PostDetailModel?, int>((ref, id) {
  print("나 만들어져? $id");
  //? 붙이 이유는 아직 데이터를 넣지않기때문에 나중에 바꿔준다.
  return PostDetailVM(null)..notifyInit(id);
});
