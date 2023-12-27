import 'package:colposcopy/data/datasources/drift/database/database.dart';
import 'package:colposcopy/data/datasources/drift/mappers/user.dart';
import 'package:colposcopy/data/datasources/base/users.dart';
import 'package:colposcopy/domain/models/role/role.dart' as model;
import 'package:colposcopy/domain/models/user/user.dart' as model;
import 'package:colposcopy/domain/models/permission/permission.dart' as model;
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UsersDatasource)
class UsersDatasourceImpl implements UsersDatasource {
  UsersDatasourceImpl({required this.database});

  final Database database;

  // User
  @override
  Future<List<model.User>> getUsers() =>
      database.select(database.users).get().then(UserMapper.toModelList);

  // TODO watch with search text
  @override
  Stream<List<model.User>> watchUsers() =>
      database.select(database.users).watch().map(UserMapper.toModelList);

  @override
  Future<int> addUser(model.User item) => database
      .into(database.users)
      .insert(UsersCompanion.insert(
        roleId: item.roleId,
        state: Value(item.state),
        firstname: item.firstname,
        lastname: item.lastname,
        password: Value(item.password),
        patronymic: item.patronymic != null
            ? Value(item.patronymic)
            : const Value.absent(),
        phone: item.phone != null ? Value(item.phone) : const Value.absent(),
        email: item.email != null ? Value(item.email) : const Value.absent(),
      ));

  @override
  Future<void> deleteUserWithId(int id) =>
      (database.delete(database.users)..where((tbl) => tbl.userId.equals(id)))
          .go();

  @override
  Future<void> updateUser(model.User item) =>
      database.update(database.users).replace(UserMapper.toEntity(item));

  @override
  Future<model.User?> getUserById(int id) async {
    var result = await (database.select(database.users)
          ..where((tbl) => tbl.userId.equals(id)))
        .get();

    return result.isEmpty ? null : UserMapper.toModel(result.first);
  }

  @override
  Future<model.User?> getUserWithIdAndPassword(
      int id, String hashedPassword) async {
    var result = await (database.select(database.users)
          ..where((tbl) =>
              tbl.userId.equals(id) & tbl.password.equals(hashedPassword)))
        .get();

    return result.isEmpty ? null : UserMapper.toModel(result.first);
  }

  // Role
  @override
  Future<model.Role?> getRoleById(int id) =>
      (database.select(database.roles)..where((tbl) => tbl.roleId.equals(id)))
          .getSingle()
          .then(RoleMapper.toModel);

  @override
  Future<int> addRole(model.Role item) => database
      .into(database.roles)
      .insert(RolesCompanion.insert(name: item.name));

  @override
  Future<void> deleteRoleWithId(int id) =>
      (database.delete(database.roles)..where((tbl) => tbl.roleId.equals(id)))
          .go();

  @override
  Future<void> updateRole(model.Role item) =>
      database.update(database.roles).replace(RoleMapper.toEntity(item));

  // Permission
  @override
  Future<model.Permission?> getPermissionById(int id) => database
      .select(database.permissions)
      .getSingle()
      .then(PermissionMapper.toModel);

  @override
  Future<int> addPermission(model.Permission item) =>
      database.into(database.permissions).insert(PermissionsCompanion.insert(
          roleId: item.roleId,
          objectName: item.objectName,
          createNew: item.createNew,
          readOwn: item.readOwn,
          editOwn: item.editOwn,
          readAll: item.readAll,
          editAll: item.editAll));

  @override
  Future<void> deletePermissionWithId(int id) =>
      (database.delete(database.permissions)
            ..where((tbl) => tbl.permissionId.equals(id)))
          .go();

  @override
  Future<void> updatePermission(model.Permission item) => database
      .update(database.permissions)
      .replace(PermissionMapper.toEntity(item));
}
