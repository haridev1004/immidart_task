import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:immidart_task/src/core/services/hive.dart';
import 'package:immidart_task/src/features/home/cubit/post/post_cubit.dart';
import 'package:immidart_task/src/features/home/domain/repository/post_repo.dart';
import 'package:immidart_task/src/features/home/presentation/screens/home_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final hiveService = HiveService();
  await hiveService.init();
  final repository = PostRepository(
    Dio(BaseOptions(validateStatus: (status) => true,)),hiveService
  );
  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final PostRepository repository;
  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => PostCubit(repository)..fetchPosts(),
        child:  HomeScreen(),
      ),
    );
  }
}
