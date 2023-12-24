import 'package:colposcopy/domain/models/role/role.dart';
import 'package:colposcopy/domain/models/user/user.dart';
import 'package:colposcopy/domain/models/permission/permission.dart';

abstract class UsersRepository {
  // User
  Future<User?> getUserById(int id);
  Future<List<User>> getUsers();
  Stream<List<User>> watchUsers();
  Future<int> addUser(User item);
  Future<void> deleteUserWithId(int id);
  Future<void> updateUser(User item);
  Future<User?> getUserWithIdAndPassword(int id, String hashedPassword);

  // Role
  Future<Role?> getRoleById(int id);
  Future<int> addRole(Role item);
  Future<void> deleteRoleWithId(int id);
  Future<void> updateRole(Role item);

  // Permission
  Future<Permission?> getPermissionById(int id);
  Future<int> addPermission(Permission item);
  Future<void> deletePermissionWithId(int id);
  Future<void> updatePermission(Permission item);
}
