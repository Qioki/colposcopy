import 'package:colposcopy/data/datasources/drift/database/database.dart';
import 'package:colposcopy/domain/models/user/user.dart' as model;
import 'package:colposcopy/domain/models/role/role.dart' as model;
import 'package:colposcopy/domain/models/permission/permission.dart' as model;

// User
class UserMapper {
  static model.User toModel(User entity) => model.User(
        userId: entity.userId,
        roleId: entity.roleId,
        state: entity.state,
        firstname: entity.firstname,
        lastname: entity.lastname,
        patronymic: entity.patronymic,
        phone: entity.phone,
        email: entity.email,
        // login: entity.login,
        userData: entity.userData,
      );

  static List<model.User> toModelList(List<User> entities) =>
      entities.map(toModel).toList();

  static User toEntity(model.User model) => User(
        userId: model.userId!, // TODO check
        roleId: model.roleId,
        state: model.state,
        firstname: model.firstname,
        lastname: model.lastname,
        patronymic: model.patronymic,
        phone: model.phone,
        email: model.email,
        // login: model.login,
        userData: model.userData,
        password: model.password,
      );
}

// Role
class RoleMapper {
  static model.Role toModel(Role entity) => model.Role(
        roleId: entity.roleId,
        name: entity.name,
      );

  static List<model.Role> toModelList(List<Role> entities) =>
      entities.map(toModel).toList();

  static Role toEntity(model.Role model) =>
      Role(roleId: model.roleId ?? 0, name: model.name);
}

// Permission
class PermissionMapper {
  static model.Permission toModel(Permission entity) => model.Permission(
        permissionId: entity.permissionId,
        roleId: entity.roleId,
        objectName: entity.objectName,
        createNew: entity.createNew,
        readOwn: entity.readOwn,
        editOwn: entity.editOwn,
        readAll: entity.readAll,
        editAll: entity.editAll,
      );

  static List<model.Permission> toModelList(List<Permission> entities) =>
      entities.map(toModel).toList();

  static Permission toEntity(model.Permission model) => Permission(
        permissionId: model.permissionId ?? 0,
        roleId: model.roleId,
        objectName: model.objectName,
        createNew: model.createNew,
        readOwn: model.readOwn,
        editOwn: model.editOwn,
        readAll: model.readAll,
        editAll: model.editAll,
      );
}
