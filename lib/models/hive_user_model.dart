import 'package:hive/hive.dart';

part 'hive_user_model.g.dart';

@HiveType(typeId: 1)
class HiveUserModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  HiveUserModel({required this.id, required this.name, required this.email});
}
