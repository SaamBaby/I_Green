import 'package:Quete/models/user/user.hive.model.dart';
import 'package:hive/hive.dart';


class UserCacheService{
  static final _box = Hive.box<UserHive>('user');

  static UserHive get user{
    return _box.get('basic');
  }
  static set user (UserHive userHive){
    print(userHive.id);
    _box.put('basic', userHive);
  }
  static String get userId => user.id;

}