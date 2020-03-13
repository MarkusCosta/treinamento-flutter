import 'package:app2/src/configs/database/app_database.dart';
import 'package:app2/src/models/dtos/user.dart';

class UserDatabaseProvider {

  const UserDatabaseProvider();

  Future<User> saveUser(User user) async {
    final db = await AppDatabase().current;
    user.id = await db.insert('users', user.toJson());
    return user;
  }

  Future<User> saveOrUpdateUser(User user) async {
    final db = await AppDatabase().current;
    if (getUser(user.id) == null) {
      user.id = await db.insert('users', user.toJson());
    } else {
      user.id = await db.update('users', user.toJson());
    }
    return user;
  }

  Future<User> getUser(int userId) async {
    final db = await AppDatabase().current;
    List<Map> data = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [userId],
    );

    return data.length > 0 ? User.fromJson(data.first) : null;
  }

  Future<List<User>> getAllUsers() async {
    final db = await AppDatabase().current;
    List<Map> data = await db.query('users');
    return data.map((userMap) => User.fromJson(userMap));
  }

  Future<User> getFirstUser() async {
    final db = await AppDatabase().current;
    List<Map> data = await db.query('users', limit: 1);
    return data.length > 0 ? User.fromJson(data.first) : null;
  }

}