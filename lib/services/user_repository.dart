import 'package:flutter_bloc_demo/models/user.dart';
import 'package:flutter_bloc_demo/services/user_ip_provider.dart';

class UsersRepository {
  final UserProvider _usersProvuder = UserProvider();

  Future<List<User>> getAllUsers() => _usersProvuder.getUser();
}
