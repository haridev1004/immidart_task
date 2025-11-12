import 'package:hive/hive.dart';

part 'post_model.g.dart'; 
@HiveType(typeId: 1)
class PostModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  const PostModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        email: json['email'] ?? '',
      );
}
