import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'post_state.dart';
import '../../domain/repository/post_repo.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepository _repository;
  StreamSubscription? _connectivitySubscription;

  PostCubit(this._repository) : super(PostInitial()) {
    _listenToConnectivity();
  }

  void _listenToConnectivity() {
  _connectivitySubscription =
      Connectivity().onConnectivityChanged.listen((results) {
    // 'results' is now a List<ConnectivityResult>
    final hasConnection = results.isNotEmpty &&
        results.any((r) => r != ConnectivityResult.none);

    if (hasConnection) {
      fetchPosts(); // Internet returned → re-sync
    }
  });
}


  Future<void> fetchPosts() async {
    emit(PostLoading());
    try {
      final posts = await _repository.fetchPosts();
      posts.sort((a, b) => a.userId.compareTo(b.userId));
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError('Failed to load posts: $e'));
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
