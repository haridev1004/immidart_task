// import 'package:hive/hive.dart';
// import '../models/user_model.dart';
// import 'package:injectable/injectable.dart';

// @lazySingleton
// class HiveService {
//   late Box<UserModel> userBox;

//   Future<void> init() async {
//     Hive.registerAdapter(UserModelAdapter());
//     userBox = await Hive.openBox<UserModel>('users');
//   }

//   Future<void> addUsers(List<UserModel> users) async {
//     await userBox.clear(); // clear old data
//     await userBox.addAll(users);
//   }

//   List<UserModel> getAllUsers() => userBox.values.toList();
// }
