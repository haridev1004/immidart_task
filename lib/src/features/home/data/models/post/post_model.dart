import 'package:hive/hive.dart';

part 'post_model.g.dart';

@HiveType(typeId: 1)
class PostModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final int userId;

  const PostModel({
    required this.id,
    required this.title,
    required this.userId,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()) ?? 0,
        title: json['title']?.toString() ?? '',
        userId: json['userId'] is int ? json['userId'] : int.tryParse(json['userId'].toString()) ?? 0,
      );
}
