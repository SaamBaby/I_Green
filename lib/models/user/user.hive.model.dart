import 'package:hive/hive.dart';

part 'user.hive.model.g.dart';

@HiveType(typeId: 0)
class UserHive extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String displayName;

  @HiveField(2)
  String profilePictureUrl;

  @HiveField(3)
  String email;

  UserHive({this.id, this.displayName,this.profilePictureUrl, this.email});
}