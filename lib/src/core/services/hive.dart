import 'package:hive/hive.dart';
import '../../features/home/data/models/post/post_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HiveService {
  late Box<PostModel> postBox;

  Future<void> init() async {
    Hive.registerAdapter(PostModelAdapter());
    postBox = await Hive.openBox<PostModel>('posts');
  }

  Future<void> addUsers(List<PostModel> posts) async {
    await postBox.clear();
    await postBox.addAll(posts);
  }

  List<PostModel> getAllPosts() => postBox.values.toList();
}
