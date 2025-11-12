import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:immidart_task/src/core/widgets/common_scaffold.dart';
import 'package:immidart_task/src/features/home/cubit/post/post_cubit.dart';
import 'package:immidart_task/src/features/home/cubit/post/post_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<PostCubit>().fetchPosts();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: "Posts",
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          await context.read<PostCubit>().fetchPosts();
        },
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PostLoaded) {
              return Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                radius: const Radius.circular(10),
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    final post = state.posts[index];
                    return ListTile(
                      title: Text(
                        'ID: ${post.id}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Description : ${post.title}'),
                    );
                  },
                ),
              );
            } else if (state is PostError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
