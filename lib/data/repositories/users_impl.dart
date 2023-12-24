import 'package:colposcopy/data/datasources/base/users.dart';
import 'package:colposcopy/domain/models/role/role.dart';
import 'package:colposcopy/domain/models/user/user.dart';
import 'package:colposcopy/domain/models/permission/permission.dart';
import 'package:colposcopy/domain/repositories/users.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UsersRepository)
class UsersRepositoryImpl extends UsersRepository {
  UsersRepositoryImpl({required this.datasource});

  UsersDatasource datasource;

  // User
  @override
  Future<List<User>> getUsers() => datasource.getUsers();

  @override
  Future<User?> getUserWithIdAndPassword(int id, String hashedPassword) =>
      datasource.getUserWithIdAndPassword(id, hashedPassword);

  @override
  Stream<List<User>> watchUsers() => datasource.watchUsers();

  @override
  Future<int> addUser(User item) => datasource.addUser(item);

  @override
  Future<void> deleteUserWithId(int id) => datasource.deleteUserWithId(id);

  @override
  Future<void> updateUser(User item) => datasource.updateUser(item);

  @override
  Future<User?> getUserById(int id) => datasource.getUserById(id);

  // Role
  @override
  Future<Role?> getRoleById(int id) => datasource.getRoleById(id);

  @override
  Future<int> addRole(Role item) => datasource.addRole(item);

  @override
  Future<void> deleteRoleWithId(int id) => datasource.deleteRoleWithId(id);

  @override
  Future<void> updateRole(Role item) => datasource.updateRole(item);

  // Permission
  @override
  Future<Permission?> getPermissionById(int id) =>
      datasource.getPermissionById(id);

  @override
  Future<int> addPermission(Permission item) => datasource.addPermission(item);

  @override
  Future<void> deletePermissionWithId(int id) =>
      datasource.deletePermissionWithId(id);

  @override
  Future<void> updatePermission(Permission item) =>
      datasource.updatePermission(item);
}
