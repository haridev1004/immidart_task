import 'package:dio/dio.dart';
import 'package:immidart_task/src/features/home/data/models/post/post_model.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repository/post_repo.dart';
import '../../../../core/services/hive.dart';

@lazySingleton
class UserRepository {
  final Dio _dio;
  final HiveService _hiveService;

  UserRepository(this._dio, this._hiveService);

  Future<List<PostModel>> fetchUsers() async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/users');
      final users = (response.data as List)
          .map((json) => PostModel.fromJson(json))
          .toList();

      await _hiveService.addUsers(users); // cache data
      return users;
    } catch (_) {
      // on error, get from local cache
      final cached = _hiveService.getAllUsers();
      if (cached.isNotEmpty) {
        return cached;
      }
      rethrow;
    }
  }
}
