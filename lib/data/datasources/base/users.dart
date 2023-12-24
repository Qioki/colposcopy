import 'package:colposcopy/domain/models/role/role.dart' as model;
import 'package:colposcopy/domain/models/user/user.dart' as model;
import 'package:colposcopy/domain/models/permission/permission.dart' as model;

abstract class UsersDatasource {
  // User
  Future<model.User?> getUserById(int id);
  Future<List<model.User>> getUsers();
  Stream<List<model.User>> watchUsers();
  Future<int> addUser(model.User item);
  Future<void> deleteUserWithId(int id);
  Future<void> updateUser(model.User item);
  Future<model.User?> getUserWithIdAndPassword(int id, String hashedPassword);

  // Role
  Future<model.Role?> getRoleById(int id);
  Future<int> addRole(model.Role item);
  Future<void> deleteRoleWithId(int id);
  Future<void> updateRole(model.Role item);

  // Permission
  Future<model.Permission?> getPermissionById(int id);
  Future<int> addPermission(model.Permission item);
  Future<void> deletePermissionWithId(int id);
  Future<void> updatePermission(model.Permission item);
}
