import 'package:blog/data/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//list_vm은 Service라고 생각하면 된다.
//-------------------------------------------------
//1. 창고
class PostLiveVM extends StateNotifier<PostListModel?> {
  PostLiveVM(super.state);

  //view는 리턴을 해줄필요가없다.
  //Future쓰는 이유는 awiat 사용할려고
  Future<void> notifyInit() async {
    //1. 통신을 해서 응답 받기
    List<dynamic> list = await PostRepository().findAll();

    //2. 파싱 : 맵타입으로 되어있으니까 map타입으로 파싱한다.
    List<_Post> posts = list.map((e) => _Post.fromMap(e)).toList();

    //3. 상태를 갱신 시킨다.
    state = PostListModel(posts); //깊은 복사 (기존 데이터를 건드리지 않는다.)
  }
}

//2. 창고 데이터(State)
//통신해서 받아야 할 데이터
class PostListModel {
  List<_Post> posts;

  PostListModel(this.posts);
}

//_ 언더바를 쓰면 그 파일에서 찾을 수 있다. 다른 파일에서는 못 찾느다.
class _Post {
  int id;
  String title;

  //fromMap = Entity와 같다고 생각하면 된다.
  //JSON(중간언어, 공용어)

  //요청 해서 JSON 데이터날아오면 자동으로 Map타입으로 자동으로 컨버팅 해준다. 자기 오브젝트로 만들어주는 게 좋다.
  _Post.fromMap(map)
      : this.id = map["id"],
        this.title = map["title"];
//this.content = map["contnet"]; // 이건 필요없는 이유는 우리는 다 만들어줄거기때문에
}

//3. 창고 관리자 (Provider)
final postListProvider =
    StateNotifierProvider<PostLiveVM, PostListModel?>((ref) {
  return PostLiveVM(null)..notifyInit();
});
