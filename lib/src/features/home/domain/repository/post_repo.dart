import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:immidart_task/src/features/home/data/models/post/post_model.dart';
import '../../../../core/services/hive.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PostRepository {
  final Dio _dio;
  final HiveService _hiveService;

  PostRepository(this._dio, this._hiveService);

  Future<List<PostModel>> fetchPosts() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final isOffline = connectivityResult == ConnectivityResult.none;

    if (isOffline) {
      log('[NETWORK] Offline, loading cached posts...');
      final cached = _hiveService.getAllPosts();
      return cached;
    }

    final startTime = DateTime.now();

    try {
      final response = await _dio.get(
        'https://6914ee983746c71fe04a12c1.mockapi.io/api/v1/posts',
      );

      final endTime = DateTime.now();
      final latency = endTime.difference(startTime).inMilliseconds;
      log('[NETWORK] API latency: ${latency}ms');

      final data = response.data is String
          ? jsonDecode(response.data)
          : response.data;

      if (data is! List) throw Exception('Invalid API format: Expected List');

      final posts = data
          .map((json) => PostModel.fromJson(json))
          .toList()
          .cast<PostModel>();

      await _hiveService.addPosts(posts);
      log('[SYNC] Data synced at: ${DateTime.now()}');

      return posts;
    } catch (e) {
      log('[ERROR] Fetch failed: $e');
      final cached = _hiveService.getAllPosts();
      if (cached.isNotEmpty) {
        log('[CACHE] Returning cached data');
        return cached;
      }
      rethrow;
    }
  }
}
