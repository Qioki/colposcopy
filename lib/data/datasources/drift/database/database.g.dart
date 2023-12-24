// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class Roles extends Table with TableInfo<Roles, Role> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Roles(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _roleIdMeta = const VerificationMeta('roleId');
  late final GeneratedColumn<int> roleId = GeneratedColumn<int>(
      'role_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints:
          'NOT NULL CONSTRAINT PK_roles PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [roleId, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'roles';
  @override
  VerificationContext validateIntegrity(Insertable<Role> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('role_id')) {
      context.handle(_roleIdMeta,
          roleId.isAcceptableOrUnknown(data['role_id']!, _roleIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {roleId};
  @override
  Role map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Role(
      roleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}role_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  Roles createAlias(String alias) {
    return Roles(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Role extends DataClass implements Insertable<Role> {
  final int roleId;
  final String name;
  const Role({required this.roleId, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['role_id'] = Variable<int>(roleId);
    map['name'] = Variable<String>(name);
    return map;
  }

  RolesCompanion toCompanion(bool nullToAbsent) {
    return RolesCompanion(
      roleId: Value(roleId),
      name: Value(name),
    );
  }

  factory Role.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Role(
      roleId: serializer.fromJson<int>(json['role_id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'role_id': serializer.toJson<int>(roleId),
      'name': serializer.toJson<String>(name),
    };
  }

  Role copyWith({int? roleId, String? name}) => Role(
        roleId: roleId ?? this.roleId,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Role(')
          ..write('roleId: $roleId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(roleId, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Role && other.roleId == this.roleId && other.name == this.name);
}

class RolesCompanion extends UpdateCompanion<Role> {
  final Value<int> roleId;
  final Value<String> name;
  const RolesCompanion({
    this.roleId = const Value.absent(),
    this.name = const Value.absent(),
  });
  RolesCompanion.insert({
    this.roleId = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Role> custom({
    Expression<int>? roleId,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (roleId != null) 'role_id': roleId,
      if (name != null) 'name': name,
    });
  }

  RolesCompanion copyWith({Value<int>? roleId, Value<String>? name}) {
    return RolesCompanion(
      roleId: roleId ?? this.roleId,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (roleId.present) {
      map['role_id'] = Variable<int>(roleId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RolesCompanion(')
          ..write('roleId: $roleId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class Permissions extends Table with TableInfo<Permissions, Permission> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Permissions(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _permissionIdMeta =
      const VerificationMeta('permissionId');
  late final GeneratedColumn<int> permissionId = GeneratedColumn<int>(
      'permission_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints:
          'NOT NULL CONSTRAINT PK_permissions PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _roleIdMeta = const VerificationMeta('roleId');
  late final GeneratedColumn<int> roleId = GeneratedColumn<int>(
      'role_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _objectNameMeta =
      const VerificationMeta('objectName');
  late final GeneratedColumn<String> objectName = GeneratedColumn<String>(
      'object_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createNewMeta =
      const VerificationMeta('createNew');
  late final GeneratedColumn<int> createNew = GeneratedColumn<int>(
      'create_new', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _readOwnMeta =
      const VerificationMeta('readOwn');
  late final GeneratedColumn<int> readOwn = GeneratedColumn<int>(
      'read_own', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _editOwnMeta =
      const VerificationMeta('editOwn');
  late final GeneratedColumn<int> editOwn = GeneratedColumn<int>(
      'edit_own', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _readAllMeta =
      const VerificationMeta('readAll');
  late final GeneratedColumn<int> readAll = GeneratedColumn<int>(
      'read_all', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _editAllMeta =
      const VerificationMeta('editAll');
  late final GeneratedColumn<int> editAll = GeneratedColumn<int>(
      'edit_all', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [
        permissionId,
        roleId,
        objectName,
        createNew,
        readOwn,
        editOwn,
        readAll,
        editAll
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'permissions';
  @override
  VerificationContext validateIntegrity(Insertable<Permission> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('permission_id')) {
      context.handle(
          _permissionIdMeta,
          permissionId.isAcceptableOrUnknown(
              data['permission_id']!, _permissionIdMeta));
    }
    if (data.containsKey('role_id')) {
      context.handle(_roleIdMeta,
          roleId.isAcceptableOrUnknown(data['role_id']!, _roleIdMeta));
    } else if (isInserting) {
      context.missing(_roleIdMeta);
    }
    if (data.containsKey('object_name')) {
      context.handle(
          _objectNameMeta,
          objectName.isAcceptableOrUnknown(
              data['object_name']!, _objectNameMeta));
    } else if (isInserting) {
      context.missing(_objectNameMeta);
    }
    if (data.containsKey('create_new')) {
      context.handle(_createNewMeta,
          createNew.isAcceptableOrUnknown(data['create_new']!, _createNewMeta));
    } else if (isInserting) {
      context.missing(_createNewMeta);
    }
    if (data.containsKey('read_own')) {
      context.handle(_readOwnMeta,
          readOwn.isAcceptableOrUnknown(data['read_own']!, _readOwnMeta));
    } else if (isInserting) {
      context.missing(_readOwnMeta);
    }
    if (data.containsKey('edit_own')) {
      context.handle(_editOwnMeta,
          editOwn.isAcceptableOrUnknown(data['edit_own']!, _editOwnMeta));
    } else if (isInserting) {
      context.missing(_editOwnMeta);
    }
    if (data.containsKey('read_all')) {
      context.handle(_readAllMeta,
          readAll.isAcceptableOrUnknown(data['read_all']!, _readAllMeta));
    } else if (isInserting) {
      context.missing(_readAllMeta);
    }
    if (data.containsKey('edit_all')) {
      context.handle(_editAllMeta,
          editAll.isAcceptableOrUnknown(data['edit_all']!, _editAllMeta));
    } else if (isInserting) {
      context.missing(_editAllMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {permissionId};
  @override
  Permission map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Permission(
      permissionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}permission_id'])!,
      roleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}role_id'])!,
      objectName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}object_name'])!,
      createNew: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}create_new'])!,
      readOwn: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}read_own'])!,
      editOwn: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}edit_own'])!,
      readAll: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}read_all'])!,
      editAll: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}edit_all'])!,
    );
  }

  @override
  Permissions createAlias(String alias) {
    return Permissions(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'CONSTRAINT FK_permissions_roles_role_id FOREIGN KEY(role_id)REFERENCES roles(role_id)ON DELETE RESTRICT'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class Permission extends DataClass implements Insertable<Permission> {
  final int permissionId;
  final int roleId;
  final String objectName;
  final int createNew;
  final int readOwn;
  final int editOwn;
  final int readAll;
  final int editAll;
  const Permission(
      {required this.permissionId,
      required this.roleId,
      required this.objectName,
      required this.createNew,
      required this.readOwn,
      required this.editOwn,
      required this.readAll,
      required this.editAll});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['permission_id'] = Variable<int>(permissionId);
    map['role_id'] = Variable<int>(roleId);
    map['object_name'] = Variable<String>(objectName);
    map['create_new'] = Variable<int>(createNew);
    map['read_own'] = Variable<int>(readOwn);
    map['edit_own'] = Variable<int>(editOwn);
    map['read_all'] = Variable<int>(readAll);
    map['edit_all'] = Variable<int>(editAll);
    return map;
  }

  PermissionsCompanion toCompanion(bool nullToAbsent) {
    return PermissionsCompanion(
      permissionId: Value(permissionId),
      roleId: Value(roleId),
      objectName: Value(objectName),
      createNew: Value(createNew),
      readOwn: Value(readOwn),
      editOwn: Value(editOwn),
      readAll: Value(readAll),
      editAll: Value(editAll),
    );
  }

  factory Permission.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Permission(
      permissionId: serializer.fromJson<int>(json['permission_id']),
      roleId: serializer.fromJson<int>(json['role_id']),
      objectName: serializer.fromJson<String>(json['object_name']),
      createNew: serializer.fromJson<int>(json['create_new']),
      readOwn: serializer.fromJson<int>(json['read_own']),
      editOwn: serializer.fromJson<int>(json['edit_own']),
      readAll: serializer.fromJson<int>(json['read_all']),
      editAll: serializer.fromJson<int>(json['edit_all']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'permission_id': serializer.toJson<int>(permissionId),
      'role_id': serializer.toJson<int>(roleId),
      'object_name': serializer.toJson<String>(objectName),
      'create_new': serializer.toJson<int>(createNew),
      'read_own': serializer.toJson<int>(readOwn),
      'edit_own': serializer.toJson<int>(editOwn),
      'read_all': serializer.toJson<int>(readAll),
      'edit_all': serializer.toJson<int>(editAll),
    };
  }

  Permission copyWith(
          {int? permissionId,
          int? roleId,
          String? objectName,
          int? createNew,
          int? readOwn,
          int? editOwn,
          int? readAll,
          int? editAll}) =>
      Permission(
        permissionId: permissionId ?? this.permissionId,
        roleId: roleId ?? this.roleId,
        objectName: objectName ?? this.objectName,
        createNew: createNew ?? this.createNew,
        readOwn: readOwn ?? this.readOwn,
        editOwn: editOwn ?? this.editOwn,
        readAll: readAll ?? this.readAll,
        editAll: editAll ?? this.editAll,
      );
  @override
  String toString() {
    return (StringBuffer('Permission(')
          ..write('permissionId: $permissionId, ')
          ..write('roleId: $roleId, ')
          ..write('objectName: $objectName, ')
          ..write('createNew: $createNew, ')
          ..write('readOwn: $readOwn, ')
          ..write('editOwn: $editOwn, ')
          ..write('readAll: $readAll, ')
          ..write('editAll: $editAll')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(permissionId, roleId, objectName, createNew,
      readOwn, editOwn, readAll, editAll);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Permission &&
          other.permissionId == this.permissionId &&
          other.roleId == this.roleId &&
          other.objectName == this.objectName &&
          other.createNew == this.createNew &&
          other.readOwn == this.readOwn &&
          other.editOwn == this.editOwn &&
          other.readAll == this.readAll &&
          other.editAll == this.editAll);
}

class PermissionsCompanion extends UpdateCompanion<Permission> {
  final Value<int> permissionId;
  final Value<int> roleId;
  final Value<String> objectName;
  final Value<int> createNew;
  final Value<int> readOwn;
  final Value<int> editOwn;
  final Value<int> readAll;
  final Value<int> editAll;
  const PermissionsCompanion({
    this.permissionId = const Value.absent(),
    this.roleId = const Value.absent(),
    this.objectName = const Value.absent(),
    this.createNew = const Value.absent(),
    this.readOwn = const Value.absent(),
    this.editOwn = const Value.absent(),
    this.readAll = const Value.absent(),
    this.editAll = const Value.absent(),
  });
  PermissionsCompanion.insert({
    this.permissionId = const Value.absent(),
    required int roleId,
    required String objectName,
    required int createNew,
    required int readOwn,
    required int editOwn,
    required int readAll,
    required int editAll,
  })  : roleId = Value(roleId),
        objectName = Value(objectName),
        createNew = Value(createNew),
        readOwn = Value(readOwn),
        editOwn = Value(editOwn),
        readAll = Value(readAll),
        editAll = Value(editAll);
  static Insertable<Permission> custom({
    Expression<int>? permissionId,
    Expression<int>? roleId,
    Expression<String>? objectName,
    Expression<int>? createNew,
    Expression<int>? readOwn,
    Expression<int>? editOwn,
    Expression<int>? readAll,
    Expression<int>? editAll,
  }) {
    return RawValuesInsertable({
      if (permissionId != null) 'permission_id': permissionId,
      if (roleId != null) 'role_id': roleId,
      if (objectName != null) 'object_name': objectName,
      if (createNew != null) 'create_new': createNew,
      if (readOwn != null) 'read_own': readOwn,
      if (editOwn != null) 'edit_own': editOwn,
      if (readAll != null) 'read_all': readAll,
      if (editAll != null) 'edit_all': editAll,
    });
  }

  PermissionsCompanion copyWith(
      {Value<int>? permissionId,
      Value<int>? roleId,
      Value<String>? objectName,
      Value<int>? createNew,
      Value<int>? readOwn,
      Value<int>? editOwn,
      Value<int>? readAll,
      Value<int>? editAll}) {
    return PermissionsCompanion(
      permissionId: permissionId ?? this.permissionId,
      roleId: roleId ?? this.roleId,
      objectName: objectName ?? this.objectName,
      createNew: createNew ?? this.createNew,
      readOwn: readOwn ?? this.readOwn,
      editOwn: editOwn ?? this.editOwn,
      readAll: readAll ?? this.readAll,
      editAll: editAll ?? this.editAll,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (permissionId.present) {
      map['permission_id'] = Variable<int>(permissionId.value);
    }
    if (roleId.present) {
      map['role_id'] = Variable<int>(roleId.value);
    }
    if (objectName.present) {
      map['object_name'] = Variable<String>(objectName.value);
    }
    if (createNew.present) {
      map['create_new'] = Variable<int>(createNew.value);
    }
    if (readOwn.present) {
      map['read_own'] = Variable<int>(readOwn.value);
    }
    if (editOwn.present) {
      map['edit_own'] = Variable<int>(editOwn.value);
    }
    if (readAll.present) {
      map['read_all'] = Variable<int>(readAll.value);
    }
    if (editAll.present) {
      map['edit_all'] = Variable<int>(editAll.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PermissionsCompanion(')
          ..write('permissionId: $permissionId, ')
          ..write('roleId: $roleId, ')
          ..write('objectName: $objectName, ')
          ..write('createNew: $createNew, ')
          ..write('readOwn: $readOwn, ')
          ..write('editOwn: $editOwn, ')
          ..write('readAll: $readAll, ')
          ..write('editAll: $editAll')
          ..write(')'))
        .toString();
  }
}

class Users extends Table with TableInfo<Users, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Users(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints:
          'NOT NULL CONSTRAINT PK_users PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _roleIdMeta = const VerificationMeta('roleId');
  late final GeneratedColumn<int> roleId = GeneratedColumn<int>(
      'role_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  late final GeneratedColumn<int> state = GeneratedColumn<int>(
      'state', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _firstnameMeta =
      const VerificationMeta('firstname');
  late final GeneratedColumn<String> firstname = GeneratedColumn<String>(
      'firstname', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _lastnameMeta =
      const VerificationMeta('lastname');
  late final GeneratedColumn<String> lastname = GeneratedColumn<String>(
      'lastname', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _patronymicMeta =
      const VerificationMeta('patronymic');
  late final GeneratedColumn<String> patronymic = GeneratedColumn<String>(
      'patronymic', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _loginMeta = const VerificationMeta('login');
  late final GeneratedColumn<String> login = GeneratedColumn<String>(
      'login', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'DEFAULT \'\' NOT NULL',
      defaultValue: const CustomExpression('\'\''));
  static const VerificationMeta _userDataMeta =
      const VerificationMeta('userData');
  late final GeneratedColumn<String> userData = GeneratedColumn<String>(
      'user_data', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        userId,
        roleId,
        state,
        firstname,
        lastname,
        patronymic,
        phone,
        email,
        login,
        password,
        userData
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('role_id')) {
      context.handle(_roleIdMeta,
          roleId.isAcceptableOrUnknown(data['role_id']!, _roleIdMeta));
    } else if (isInserting) {
      context.missing(_roleIdMeta);
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    if (data.containsKey('firstname')) {
      context.handle(_firstnameMeta,
          firstname.isAcceptableOrUnknown(data['firstname']!, _firstnameMeta));
    } else if (isInserting) {
      context.missing(_firstnameMeta);
    }
    if (data.containsKey('lastname')) {
      context.handle(_lastnameMeta,
          lastname.isAcceptableOrUnknown(data['lastname']!, _lastnameMeta));
    } else if (isInserting) {
      context.missing(_lastnameMeta);
    }
    if (data.containsKey('patronymic')) {
      context.handle(
          _patronymicMeta,
          patronymic.isAcceptableOrUnknown(
              data['patronymic']!, _patronymicMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('login')) {
      context.handle(
          _loginMeta, login.isAcceptableOrUnknown(data['login']!, _loginMeta));
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    }
    if (data.containsKey('user_data')) {
      context.handle(_userDataMeta,
          userData.isAcceptableOrUnknown(data['user_data']!, _userDataMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      roleId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}role_id'])!,
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}state'])!,
      firstname: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}firstname'])!,
      lastname: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lastname'])!,
      patronymic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}patronymic']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      login: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}login']),
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      userData: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_data']),
    );
  }

  @override
  Users createAlias(String alias) {
    return Users(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'CONSTRAINT FK_users_roles_role_id FOREIGN KEY(role_id)REFERENCES roles(role_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class User extends DataClass implements Insertable<User> {
  final int userId;
  final int roleId;
  final int state;
  final String firstname;
  final String lastname;
  final String? patronymic;
  final String? phone;
  final String? email;
  final String? login;
  final String password;
  final String? userData;
  const User(
      {required this.userId,
      required this.roleId,
      required this.state,
      required this.firstname,
      required this.lastname,
      this.patronymic,
      this.phone,
      this.email,
      this.login,
      required this.password,
      this.userData});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['role_id'] = Variable<int>(roleId);
    map['state'] = Variable<int>(state);
    map['firstname'] = Variable<String>(firstname);
    map['lastname'] = Variable<String>(lastname);
    if (!nullToAbsent || patronymic != null) {
      map['patronymic'] = Variable<String>(patronymic);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || login != null) {
      map['login'] = Variable<String>(login);
    }
    map['password'] = Variable<String>(password);
    if (!nullToAbsent || userData != null) {
      map['user_data'] = Variable<String>(userData);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      userId: Value(userId),
      roleId: Value(roleId),
      state: Value(state),
      firstname: Value(firstname),
      lastname: Value(lastname),
      patronymic: patronymic == null && nullToAbsent
          ? const Value.absent()
          : Value(patronymic),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      login:
          login == null && nullToAbsent ? const Value.absent() : Value(login),
      password: Value(password),
      userData: userData == null && nullToAbsent
          ? const Value.absent()
          : Value(userData),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      userId: serializer.fromJson<int>(json['user_id']),
      roleId: serializer.fromJson<int>(json['role_id']),
      state: serializer.fromJson<int>(json['state']),
      firstname: serializer.fromJson<String>(json['firstname']),
      lastname: serializer.fromJson<String>(json['lastname']),
      patronymic: serializer.fromJson<String?>(json['patronymic']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      login: serializer.fromJson<String?>(json['login']),
      password: serializer.fromJson<String>(json['password']),
      userData: serializer.fromJson<String?>(json['user_data']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'user_id': serializer.toJson<int>(userId),
      'role_id': serializer.toJson<int>(roleId),
      'state': serializer.toJson<int>(state),
      'firstname': serializer.toJson<String>(firstname),
      'lastname': serializer.toJson<String>(lastname),
      'patronymic': serializer.toJson<String?>(patronymic),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'login': serializer.toJson<String?>(login),
      'password': serializer.toJson<String>(password),
      'user_data': serializer.toJson<String?>(userData),
    };
  }

  User copyWith(
          {int? userId,
          int? roleId,
          int? state,
          String? firstname,
          String? lastname,
          Value<String?> patronymic = const Value.absent(),
          Value<String?> phone = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> login = const Value.absent(),
          String? password,
          Value<String?> userData = const Value.absent()}) =>
      User(
        userId: userId ?? this.userId,
        roleId: roleId ?? this.roleId,
        state: state ?? this.state,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        patronymic: patronymic.present ? patronymic.value : this.patronymic,
        phone: phone.present ? phone.value : this.phone,
        email: email.present ? email.value : this.email,
        login: login.present ? login.value : this.login,
        password: password ?? this.password,
        userData: userData.present ? userData.value : this.userData,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('userId: $userId, ')
          ..write('roleId: $roleId, ')
          ..write('state: $state, ')
          ..write('firstname: $firstname, ')
          ..write('lastname: $lastname, ')
          ..write('patronymic: $patronymic, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('login: $login, ')
          ..write('password: $password, ')
          ..write('userData: $userData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, roleId, state, firstname, lastname,
      patronymic, phone, email, login, password, userData);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.userId == this.userId &&
          other.roleId == this.roleId &&
          other.state == this.state &&
          other.firstname == this.firstname &&
          other.lastname == this.lastname &&
          other.patronymic == this.patronymic &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.login == this.login &&
          other.password == this.password &&
          other.userData == this.userData);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> userId;
  final Value<int> roleId;
  final Value<int> state;
  final Value<String> firstname;
  final Value<String> lastname;
  final Value<String?> patronymic;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> login;
  final Value<String> password;
  final Value<String?> userData;
  const UsersCompanion({
    this.userId = const Value.absent(),
    this.roleId = const Value.absent(),
    this.state = const Value.absent(),
    this.firstname = const Value.absent(),
    this.lastname = const Value.absent(),
    this.patronymic = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.login = const Value.absent(),
    this.password = const Value.absent(),
    this.userData = const Value.absent(),
  });
  UsersCompanion.insert({
    this.userId = const Value.absent(),
    required int roleId,
    required int state,
    required String firstname,
    required String lastname,
    this.patronymic = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.login = const Value.absent(),
    this.password = const Value.absent(),
    this.userData = const Value.absent(),
  })  : roleId = Value(roleId),
        state = Value(state),
        firstname = Value(firstname),
        lastname = Value(lastname);
  static Insertable<User> custom({
    Expression<int>? userId,
    Expression<int>? roleId,
    Expression<int>? state,
    Expression<String>? firstname,
    Expression<String>? lastname,
    Expression<String>? patronymic,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? login,
    Expression<String>? password,
    Expression<String>? userData,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (roleId != null) 'role_id': roleId,
      if (state != null) 'state': state,
      if (firstname != null) 'firstname': firstname,
      if (lastname != null) 'lastname': lastname,
      if (patronymic != null) 'patronymic': patronymic,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (login != null) 'login': login,
      if (password != null) 'password': password,
      if (userData != null) 'user_data': userData,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? userId,
      Value<int>? roleId,
      Value<int>? state,
      Value<String>? firstname,
      Value<String>? lastname,
      Value<String?>? patronymic,
      Value<String?>? phone,
      Value<String?>? email,
      Value<String?>? login,
      Value<String>? password,
      Value<String?>? userData}) {
    return UsersCompanion(
      userId: userId ?? this.userId,
      roleId: roleId ?? this.roleId,
      state: state ?? this.state,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      patronymic: patronymic ?? this.patronymic,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      login: login ?? this.login,
      password: password ?? this.password,
      userData: userData ?? this.userData,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (roleId.present) {
      map['role_id'] = Variable<int>(roleId.value);
    }
    if (state.present) {
      map['state'] = Variable<int>(state.value);
    }
    if (firstname.present) {
      map['firstname'] = Variable<String>(firstname.value);
    }
    if (lastname.present) {
      map['lastname'] = Variable<String>(lastname.value);
    }
    if (patronymic.present) {
      map['patronymic'] = Variable<String>(patronymic.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (login.present) {
      map['login'] = Variable<String>(login.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (userData.present) {
      map['user_data'] = Variable<String>(userData.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('userId: $userId, ')
          ..write('roleId: $roleId, ')
          ..write('state: $state, ')
          ..write('firstname: $firstname, ')
          ..write('lastname: $lastname, ')
          ..write('patronymic: $patronymic, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('login: $login, ')
          ..write('password: $password, ')
          ..write('userData: $userData')
          ..write(')'))
        .toString();
  }
}

class Settings extends Table with TableInfo<Settings, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Settings(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _settingIdMeta =
      const VerificationMeta('settingId');
  late final GeneratedColumn<int> settingId = GeneratedColumn<int>(
      'setting_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints:
          'NOT NULL CONSTRAINT PK_settings PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _paramMeta = const VerificationMeta('param');
  late final GeneratedColumn<String> param = GeneratedColumn<String>(
      'param', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [settingId, userId, param, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(Insertable<Setting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('setting_id')) {
      context.handle(_settingIdMeta,
          settingId.isAcceptableOrUnknown(data['setting_id']!, _settingIdMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('param')) {
      context.handle(
          _paramMeta, param.isAcceptableOrUnknown(data['param']!, _paramMeta));
    } else if (isInserting) {
      context.missing(_paramMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {settingId};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      settingId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}setting_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      param: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}param'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
    );
  }

  @override
  Settings createAlias(String alias) {
    return Settings(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'CONSTRAINT FK_settings_users_user_id FOREIGN KEY(user_id)REFERENCES users(user_id)ON DELETE RESTRICT'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class Setting extends DataClass implements Insertable<Setting> {
  final int settingId;
  final int userId;
  final String param;
  final String value;
  const Setting(
      {required this.settingId,
      required this.userId,
      required this.param,
      required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['setting_id'] = Variable<int>(settingId);
    map['user_id'] = Variable<int>(userId);
    map['param'] = Variable<String>(param);
    map['value'] = Variable<String>(value);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      settingId: Value(settingId),
      userId: Value(userId),
      param: Value(param),
      value: Value(value),
    );
  }

  factory Setting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      settingId: serializer.fromJson<int>(json['setting_id']),
      userId: serializer.fromJson<int>(json['user_id']),
      param: serializer.fromJson<String>(json['param']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'setting_id': serializer.toJson<int>(settingId),
      'user_id': serializer.toJson<int>(userId),
      'param': serializer.toJson<String>(param),
      'value': serializer.toJson<String>(value),
    };
  }

  Setting copyWith(
          {int? settingId, int? userId, String? param, String? value}) =>
      Setting(
        settingId: settingId ?? this.settingId,
        userId: userId ?? this.userId,
        param: param ?? this.param,
        value: value ?? this.value,
      );
  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('settingId: $settingId, ')
          ..write('userId: $userId, ')
          ..write('param: $param, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(settingId, userId, param, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.settingId == this.settingId &&
          other.userId == this.userId &&
          other.param == this.param &&
          other.value == this.value);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<int> settingId;
  final Value<int> userId;
  final Value<String> param;
  final Value<String> value;
  const SettingsCompanion({
    this.settingId = const Value.absent(),
    this.userId = const Value.absent(),
    this.param = const Value.absent(),
    this.value = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.settingId = const Value.absent(),
    required int userId,
    required String param,
    required String value,
  })  : userId = Value(userId),
        param = Value(param),
        value = Value(value);
  static Insertable<Setting> custom({
    Expression<int>? settingId,
    Expression<int>? userId,
    Expression<String>? param,
    Expression<String>? value,
  }) {
    return RawValuesInsertable({
      if (settingId != null) 'setting_id': settingId,
      if (userId != null) 'user_id': userId,
      if (param != null) 'param': param,
      if (value != null) 'value': value,
    });
  }

  SettingsCompanion copyWith(
      {Value<int>? settingId,
      Value<int>? userId,
      Value<String>? param,
      Value<String>? value}) {
    return SettingsCompanion(
      settingId: settingId ?? this.settingId,
      userId: userId ?? this.userId,
      param: param ?? this.param,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (settingId.present) {
      map['setting_id'] = Variable<int>(settingId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (param.present) {
      map['param'] = Variable<String>(param.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('settingId: $settingId, ')
          ..write('userId: $userId, ')
          ..write('param: $param, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class Patients extends Table with TableInfo<Patients, Patient> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Patients(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  late final GeneratedColumn<int> patientId = GeneratedColumn<int>(
      'patient_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints:
          'NOT NULL CONSTRAINT PK_patients PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  late final GeneratedColumn<int> state = GeneratedColumn<int>(
      'state', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _firstnameMeta =
      const VerificationMeta('firstname');
  late final GeneratedColumn<String> firstname = GeneratedColumn<String>(
      'firstname', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _lastnameMeta =
      const VerificationMeta('lastname');
  late final GeneratedColumn<String> lastname = GeneratedColumn<String>(
      'lastname', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _patronymicMeta =
      const VerificationMeta('patronymic');
  late final GeneratedColumn<String> patronymic = GeneratedColumn<String>(
      'patronymic', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _birthdayMeta =
      const VerificationMeta('birthday');
  late final GeneratedColumn<DateTime> birthday = GeneratedColumn<DateTime>(
      'birthday', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _snilsMeta = const VerificationMeta('snils');
  late final GeneratedColumn<String> snils = GeneratedColumn<String>(
      'snils', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _policyMeta = const VerificationMeta('policy');
  late final GeneratedColumn<String> policy = GeneratedColumn<String>(
      'policy', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _cardMeta = const VerificationMeta('card');
  late final GeneratedColumn<String> card = GeneratedColumn<String>(
      'card', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        patientId,
        userId,
        state,
        firstname,
        lastname,
        patronymic,
        phone,
        email,
        birthday,
        snils,
        policy,
        card
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'patients';
  @override
  VerificationContext validateIntegrity(Insertable<Patient> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    if (data.containsKey('firstname')) {
      context.handle(_firstnameMeta,
          firstname.isAcceptableOrUnknown(data['firstname']!, _firstnameMeta));
    } else if (isInserting) {
      context.missing(_firstnameMeta);
    }
    if (data.containsKey('lastname')) {
      context.handle(_lastnameMeta,
          lastname.isAcceptableOrUnknown(data['lastname']!, _lastnameMeta));
    } else if (isInserting) {
      context.missing(_lastnameMeta);
    }
    if (data.containsKey('patronymic')) {
      context.handle(
          _patronymicMeta,
          patronymic.isAcceptableOrUnknown(
              data['patronymic']!, _patronymicMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('birthday')) {
      context.handle(_birthdayMeta,
          birthday.isAcceptableOrUnknown(data['birthday']!, _birthdayMeta));
    }
    if (data.containsKey('snils')) {
      context.handle(
          _snilsMeta, snils.isAcceptableOrUnknown(data['snils']!, _snilsMeta));
    }
    if (data.containsKey('policy')) {
      context.handle(_policyMeta,
          policy.isAcceptableOrUnknown(data['policy']!, _policyMeta));
    }
    if (data.containsKey('card')) {
      context.handle(
          _cardMeta, card.isAcceptableOrUnknown(data['card']!, _cardMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {patientId};
  @override
  Patient map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Patient(
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}patient_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}state'])!,
      firstname: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}firstname'])!,
      lastname: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lastname'])!,
      patronymic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}patronymic']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      birthday: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}birthday']),
      snils: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}snils']),
      policy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}policy']),
      card: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}card']),
    );
  }

  @override
  Patients createAlias(String alias) {
    return Patients(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'CONSTRAINT FK_patients_users_user_id FOREIGN KEY(user_id)REFERENCES users(user_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class Patient extends DataClass implements Insertable<Patient> {
  final int patientId;
  final int userId;
  final int state;
  final String firstname;
  final String lastname;
  final String? patronymic;
  final String? phone;
  final String? email;
  final DateTime? birthday;
  final String? snils;
  final String? policy;
  final String? card;
  const Patient(
      {required this.patientId,
      required this.userId,
      required this.state,
      required this.firstname,
      required this.lastname,
      this.patronymic,
      this.phone,
      this.email,
      this.birthday,
      this.snils,
      this.policy,
      this.card});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['patient_id'] = Variable<int>(patientId);
    map['user_id'] = Variable<int>(userId);
    map['state'] = Variable<int>(state);
    map['firstname'] = Variable<String>(firstname);
    map['lastname'] = Variable<String>(lastname);
    if (!nullToAbsent || patronymic != null) {
      map['patronymic'] = Variable<String>(patronymic);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || birthday != null) {
      map['birthday'] = Variable<DateTime>(birthday);
    }
    if (!nullToAbsent || snils != null) {
      map['snils'] = Variable<String>(snils);
    }
    if (!nullToAbsent || policy != null) {
      map['policy'] = Variable<String>(policy);
    }
    if (!nullToAbsent || card != null) {
      map['card'] = Variable<String>(card);
    }
    return map;
  }

  PatientsCompanion toCompanion(bool nullToAbsent) {
    return PatientsCompanion(
      patientId: Value(patientId),
      userId: Value(userId),
      state: Value(state),
      firstname: Value(firstname),
      lastname: Value(lastname),
      patronymic: patronymic == null && nullToAbsent
          ? const Value.absent()
          : Value(patronymic),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      birthday: birthday == null && nullToAbsent
          ? const Value.absent()
          : Value(birthday),
      snils:
          snils == null && nullToAbsent ? const Value.absent() : Value(snils),
      policy:
          policy == null && nullToAbsent ? const Value.absent() : Value(policy),
      card: card == null && nullToAbsent ? const Value.absent() : Value(card),
    );
  }

  factory Patient.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Patient(
      patientId: serializer.fromJson<int>(json['patient_id']),
      userId: serializer.fromJson<int>(json['user_id']),
      state: serializer.fromJson<int>(json['state']),
      firstname: serializer.fromJson<String>(json['firstname']),
      lastname: serializer.fromJson<String>(json['lastname']),
      patronymic: serializer.fromJson<String?>(json['patronymic']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      birthday: serializer.fromJson<DateTime?>(json['birthday']),
      snils: serializer.fromJson<String?>(json['snils']),
      policy: serializer.fromJson<String?>(json['policy']),
      card: serializer.fromJson<String?>(json['card']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'patient_id': serializer.toJson<int>(patientId),
      'user_id': serializer.toJson<int>(userId),
      'state': serializer.toJson<int>(state),
      'firstname': serializer.toJson<String>(firstname),
      'lastname': serializer.toJson<String>(lastname),
      'patronymic': serializer.toJson<String?>(patronymic),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'birthday': serializer.toJson<DateTime?>(birthday),
      'snils': serializer.toJson<String?>(snils),
      'policy': serializer.toJson<String?>(policy),
      'card': serializer.toJson<String?>(card),
    };
  }

  Patient copyWith(
          {int? patientId,
          int? userId,
          int? state,
          String? firstname,
          String? lastname,
          Value<String?> patronymic = const Value.absent(),
          Value<String?> phone = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<DateTime?> birthday = const Value.absent(),
          Value<String?> snils = const Value.absent(),
          Value<String?> policy = const Value.absent(),
          Value<String?> card = const Value.absent()}) =>
      Patient(
        patientId: patientId ?? this.patientId,
        userId: userId ?? this.userId,
        state: state ?? this.state,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        patronymic: patronymic.present ? patronymic.value : this.patronymic,
        phone: phone.present ? phone.value : this.phone,
        email: email.present ? email.value : this.email,
        birthday: birthday.present ? birthday.value : this.birthday,
        snils: snils.present ? snils.value : this.snils,
        policy: policy.present ? policy.value : this.policy,
        card: card.present ? card.value : this.card,
      );
  @override
  String toString() {
    return (StringBuffer('Patient(')
          ..write('patientId: $patientId, ')
          ..write('userId: $userId, ')
          ..write('state: $state, ')
          ..write('firstname: $firstname, ')
          ..write('lastname: $lastname, ')
          ..write('patronymic: $patronymic, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('birthday: $birthday, ')
          ..write('snils: $snils, ')
          ..write('policy: $policy, ')
          ..write('card: $card')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(patientId, userId, state, firstname, lastname,
      patronymic, phone, email, birthday, snils, policy, card);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Patient &&
          other.patientId == this.patientId &&
          other.userId == this.userId &&
          other.state == this.state &&
          other.firstname == this.firstname &&
          other.lastname == this.lastname &&
          other.patronymic == this.patronymic &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.birthday == this.birthday &&
          other.snils == this.snils &&
          other.policy == this.policy &&
          other.card == this.card);
}

class PatientsCompanion extends UpdateCompanion<Patient> {
  final Value<int> patientId;
  final Value<int> userId;
  final Value<int> state;
  final Value<String> firstname;
  final Value<String> lastname;
  final Value<String?> patronymic;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<DateTime?> birthday;
  final Value<String?> snils;
  final Value<String?> policy;
  final Value<String?> card;
  const PatientsCompanion({
    this.patientId = const Value.absent(),
    this.userId = const Value.absent(),
    this.state = const Value.absent(),
    this.firstname = const Value.absent(),
    this.lastname = const Value.absent(),
    this.patronymic = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.birthday = const Value.absent(),
    this.snils = const Value.absent(),
    this.policy = const Value.absent(),
    this.card = const Value.absent(),
  });
  PatientsCompanion.insert({
    this.patientId = const Value.absent(),
    required int userId,
    required int state,
    required String firstname,
    required String lastname,
    this.patronymic = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.birthday = const Value.absent(),
    this.snils = const Value.absent(),
    this.policy = const Value.absent(),
    this.card = const Value.absent(),
  })  : userId = Value(userId),
        state = Value(state),
        firstname = Value(firstname),
        lastname = Value(lastname);
  static Insertable<Patient> custom({
    Expression<int>? patientId,
    Expression<int>? userId,
    Expression<int>? state,
    Expression<String>? firstname,
    Expression<String>? lastname,
    Expression<String>? patronymic,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<DateTime>? birthday,
    Expression<String>? snils,
    Expression<String>? policy,
    Expression<String>? card,
  }) {
    return RawValuesInsertable({
      if (patientId != null) 'patient_id': patientId,
      if (userId != null) 'user_id': userId,
      if (state != null) 'state': state,
      if (firstname != null) 'firstname': firstname,
      if (lastname != null) 'lastname': lastname,
      if (patronymic != null) 'patronymic': patronymic,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (birthday != null) 'birthday': birthday,
      if (snils != null) 'snils': snils,
      if (policy != null) 'policy': policy,
      if (card != null) 'card': card,
    });
  }

  PatientsCompanion copyWith(
      {Value<int>? patientId,
      Value<int>? userId,
      Value<int>? state,
      Value<String>? firstname,
      Value<String>? lastname,
      Value<String?>? patronymic,
      Value<String?>? phone,
      Value<String?>? email,
      Value<DateTime?>? birthday,
      Value<String?>? snils,
      Value<String?>? policy,
      Value<String?>? card}) {
    return PatientsCompanion(
      patientId: patientId ?? this.patientId,
      userId: userId ?? this.userId,
      state: state ?? this.state,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      patronymic: patronymic ?? this.patronymic,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      birthday: birthday ?? this.birthday,
      snils: snils ?? this.snils,
      policy: policy ?? this.policy,
      card: card ?? this.card,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (patientId.present) {
      map['patient_id'] = Variable<int>(patientId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (state.present) {
      map['state'] = Variable<int>(state.value);
    }
    if (firstname.present) {
      map['firstname'] = Variable<String>(firstname.value);
    }
    if (lastname.present) {
      map['lastname'] = Variable<String>(lastname.value);
    }
    if (patronymic.present) {
      map['patronymic'] = Variable<String>(patronymic.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (birthday.present) {
      map['birthday'] = Variable<DateTime>(birthday.value);
    }
    if (snils.present) {
      map['snils'] = Variable<String>(snils.value);
    }
    if (policy.present) {
      map['policy'] = Variable<String>(policy.value);
    }
    if (card.present) {
      map['card'] = Variable<String>(card.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PatientsCompanion(')
          ..write('patientId: $patientId, ')
          ..write('userId: $userId, ')
          ..write('state: $state, ')
          ..write('firstname: $firstname, ')
          ..write('lastname: $lastname, ')
          ..write('patronymic: $patronymic, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('birthday: $birthday, ')
          ..write('snils: $snils, ')
          ..write('policy: $policy, ')
          ..write('card: $card')
          ..write(')'))
        .toString();
  }
}

class Protocols extends Table with TableInfo<Protocols, Protocol> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Protocols(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _protocolIdMeta =
      const VerificationMeta('protocolId');
  late final GeneratedColumn<int> protocolId = GeneratedColumn<int>(
      'protocol_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints:
          'NOT NULL CONSTRAINT PK_protocols PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  late final GeneratedColumn<int> state = GeneratedColumn<int>(
      'state', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _schemeMeta = const VerificationMeta('scheme');
  late final GeneratedColumn<String> scheme = GeneratedColumn<String>(
      'scheme', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [protocolId, state, scheme];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'protocols';
  @override
  VerificationContext validateIntegrity(Insertable<Protocol> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('protocol_id')) {
      context.handle(
          _protocolIdMeta,
          protocolId.isAcceptableOrUnknown(
              data['protocol_id']!, _protocolIdMeta));
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    if (data.containsKey('scheme')) {
      context.handle(_schemeMeta,
          scheme.isAcceptableOrUnknown(data['scheme']!, _schemeMeta));
    } else if (isInserting) {
      context.missing(_schemeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {protocolId};
  @override
  Protocol map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Protocol(
      protocolId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}protocol_id'])!,
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}state'])!,
      scheme: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scheme'])!,
    );
  }

  @override
  Protocols createAlias(String alias) {
    return Protocols(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Protocol extends DataClass implements Insertable<Protocol> {
  final int protocolId;
  final int state;
  final String scheme;
  const Protocol(
      {required this.protocolId, required this.state, required this.scheme});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['protocol_id'] = Variable<int>(protocolId);
    map['state'] = Variable<int>(state);
    map['scheme'] = Variable<String>(scheme);
    return map;
  }

  ProtocolsCompanion toCompanion(bool nullToAbsent) {
    return ProtocolsCompanion(
      protocolId: Value(protocolId),
      state: Value(state),
      scheme: Value(scheme),
    );
  }

  factory Protocol.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Protocol(
      protocolId: serializer.fromJson<int>(json['protocol_id']),
      state: serializer.fromJson<int>(json['state']),
      scheme: serializer.fromJson<String>(json['scheme']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'protocol_id': serializer.toJson<int>(protocolId),
      'state': serializer.toJson<int>(state),
      'scheme': serializer.toJson<String>(scheme),
    };
  }

  Protocol copyWith({int? protocolId, int? state, String? scheme}) => Protocol(
        protocolId: protocolId ?? this.protocolId,
        state: state ?? this.state,
        scheme: scheme ?? this.scheme,
      );
  @override
  String toString() {
    return (StringBuffer('Protocol(')
          ..write('protocolId: $protocolId, ')
          ..write('state: $state, ')
          ..write('scheme: $scheme')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(protocolId, state, scheme);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Protocol &&
          other.protocolId == this.protocolId &&
          other.state == this.state &&
          other.scheme == this.scheme);
}

class ProtocolsCompanion extends UpdateCompanion<Protocol> {
  final Value<int> protocolId;
  final Value<int> state;
  final Value<String> scheme;
  const ProtocolsCompanion({
    this.protocolId = const Value.absent(),
    this.state = const Value.absent(),
    this.scheme = const Value.absent(),
  });
  ProtocolsCompanion.insert({
    this.protocolId = const Value.absent(),
    required int state,
    required String scheme,
  })  : state = Value(state),
        scheme = Value(scheme);
  static Insertable<Protocol> custom({
    Expression<int>? protocolId,
    Expression<int>? state,
    Expression<String>? scheme,
  }) {
    return RawValuesInsertable({
      if (protocolId != null) 'protocol_id': protocolId,
      if (state != null) 'state': state,
      if (scheme != null) 'scheme': scheme,
    });
  }

  ProtocolsCompanion copyWith(
      {Value<int>? protocolId, Value<int>? state, Value<String>? scheme}) {
    return ProtocolsCompanion(
      protocolId: protocolId ?? this.protocolId,
      state: state ?? this.state,
      scheme: scheme ?? this.scheme,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (protocolId.present) {
      map['protocol_id'] = Variable<int>(protocolId.value);
    }
    if (state.present) {
      map['state'] = Variable<int>(state.value);
    }
    if (scheme.present) {
      map['scheme'] = Variable<String>(scheme.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProtocolsCompanion(')
          ..write('protocolId: $protocolId, ')
          ..write('state: $state, ')
          ..write('scheme: $scheme')
          ..write(')'))
        .toString();
  }
}

class Visits extends Table with TableInfo<Visits, Visit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Visits(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _visitIdMeta =
      const VerificationMeta('visitId');
  late final GeneratedColumn<int> visitId = GeneratedColumn<int>(
      'visit_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints:
          'NOT NULL CONSTRAINT PK_visits PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  late final GeneratedColumn<int> patientId = GeneratedColumn<int>(
      'patient_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _protocolIdMeta =
      const VerificationMeta('protocolId');
  late final GeneratedColumn<int> protocolId = GeneratedColumn<int>(
      'protocol_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _visitDateMeta =
      const VerificationMeta('visitDate');
  late final GeneratedColumn<DateTime> visitDate = GeneratedColumn<DateTime>(
      'visit_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _protocolDataMeta =
      const VerificationMeta('protocolData');
  late final GeneratedColumn<String> protocolData = GeneratedColumn<String>(
      'protocol_data', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [visitId, userId, patientId, protocolId, visitDate, protocolData];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'visits';
  @override
  VerificationContext validateIntegrity(Insertable<Visit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('visit_id')) {
      context.handle(_visitIdMeta,
          visitId.isAcceptableOrUnknown(data['visit_id']!, _visitIdMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('protocol_id')) {
      context.handle(
          _protocolIdMeta,
          protocolId.isAcceptableOrUnknown(
              data['protocol_id']!, _protocolIdMeta));
    } else if (isInserting) {
      context.missing(_protocolIdMeta);
    }
    if (data.containsKey('visit_date')) {
      context.handle(_visitDateMeta,
          visitDate.isAcceptableOrUnknown(data['visit_date']!, _visitDateMeta));
    } else if (isInserting) {
      context.missing(_visitDateMeta);
    }
    if (data.containsKey('protocol_data')) {
      context.handle(
          _protocolDataMeta,
          protocolData.isAcceptableOrUnknown(
              data['protocol_data']!, _protocolDataMeta));
    } else if (isInserting) {
      context.missing(_protocolDataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {visitId};
  @override
  Visit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Visit(
      visitId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}visit_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}patient_id'])!,
      protocolId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}protocol_id'])!,
      visitDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}visit_date'])!,
      protocolData: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}protocol_data'])!,
    );
  }

  @override
  Visits createAlias(String alias) {
    return Visits(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'CONSTRAINT FK_visits_users_user_id FOREIGN KEY(user_id)REFERENCES users(user_id)',
        'CONSTRAINT FK_visits_patients_patient_id FOREIGN KEY(patient_id)REFERENCES patients(patient_id)',
        'CONSTRAINT FK_visits_protocols_protocol_id FOREIGN KEY(protocol_id)REFERENCES protocols(protocol_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class Visit extends DataClass implements Insertable<Visit> {
  final int visitId;
  final int userId;
  final int patientId;
  final int protocolId;
  final DateTime visitDate;
  final String protocolData;
  const Visit(
      {required this.visitId,
      required this.userId,
      required this.patientId,
      required this.protocolId,
      required this.visitDate,
      required this.protocolData});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['visit_id'] = Variable<int>(visitId);
    map['user_id'] = Variable<int>(userId);
    map['patient_id'] = Variable<int>(patientId);
    map['protocol_id'] = Variable<int>(protocolId);
    map['visit_date'] = Variable<DateTime>(visitDate);
    map['protocol_data'] = Variable<String>(protocolData);
    return map;
  }

  VisitsCompanion toCompanion(bool nullToAbsent) {
    return VisitsCompanion(
      visitId: Value(visitId),
      userId: Value(userId),
      patientId: Value(patientId),
      protocolId: Value(protocolId),
      visitDate: Value(visitDate),
      protocolData: Value(protocolData),
    );
  }

  factory Visit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Visit(
      visitId: serializer.fromJson<int>(json['visit_id']),
      userId: serializer.fromJson<int>(json['user_id']),
      patientId: serializer.fromJson<int>(json['patient_id']),
      protocolId: serializer.fromJson<int>(json['protocol_id']),
      visitDate: serializer.fromJson<DateTime>(json['visit_date']),
      protocolData: serializer.fromJson<String>(json['protocol_data']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'visit_id': serializer.toJson<int>(visitId),
      'user_id': serializer.toJson<int>(userId),
      'patient_id': serializer.toJson<int>(patientId),
      'protocol_id': serializer.toJson<int>(protocolId),
      'visit_date': serializer.toJson<DateTime>(visitDate),
      'protocol_data': serializer.toJson<String>(protocolData),
    };
  }

  Visit copyWith(
          {int? visitId,
          int? userId,
          int? patientId,
          int? protocolId,
          DateTime? visitDate,
          String? protocolData}) =>
      Visit(
        visitId: visitId ?? this.visitId,
        userId: userId ?? this.userId,
        patientId: patientId ?? this.patientId,
        protocolId: protocolId ?? this.protocolId,
        visitDate: visitDate ?? this.visitDate,
        protocolData: protocolData ?? this.protocolData,
      );
  @override
  String toString() {
    return (StringBuffer('Visit(')
          ..write('visitId: $visitId, ')
          ..write('userId: $userId, ')
          ..write('patientId: $patientId, ')
          ..write('protocolId: $protocolId, ')
          ..write('visitDate: $visitDate, ')
          ..write('protocolData: $protocolData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      visitId, userId, patientId, protocolId, visitDate, protocolData);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Visit &&
          other.visitId == this.visitId &&
          other.userId == this.userId &&
          other.patientId == this.patientId &&
          other.protocolId == this.protocolId &&
          other.visitDate == this.visitDate &&
          other.protocolData == this.protocolData);
}

class VisitsCompanion extends UpdateCompanion<Visit> {
  final Value<int> visitId;
  final Value<int> userId;
  final Value<int> patientId;
  final Value<int> protocolId;
  final Value<DateTime> visitDate;
  final Value<String> protocolData;
  const VisitsCompanion({
    this.visitId = const Value.absent(),
    this.userId = const Value.absent(),
    this.patientId = const Value.absent(),
    this.protocolId = const Value.absent(),
    this.visitDate = const Value.absent(),
    this.protocolData = const Value.absent(),
  });
  VisitsCompanion.insert({
    this.visitId = const Value.absent(),
    required int userId,
    required int patientId,
    required int protocolId,
    required DateTime visitDate,
    required String protocolData,
  })  : userId = Value(userId),
        patientId = Value(patientId),
        protocolId = Value(protocolId),
        visitDate = Value(visitDate),
        protocolData = Value(protocolData);
  static Insertable<Visit> custom({
    Expression<int>? visitId,
    Expression<int>? userId,
    Expression<int>? patientId,
    Expression<int>? protocolId,
    Expression<DateTime>? visitDate,
    Expression<String>? protocolData,
  }) {
    return RawValuesInsertable({
      if (visitId != null) 'visit_id': visitId,
      if (userId != null) 'user_id': userId,
      if (patientId != null) 'patient_id': patientId,
      if (protocolId != null) 'protocol_id': protocolId,
      if (visitDate != null) 'visit_date': visitDate,
      if (protocolData != null) 'protocol_data': protocolData,
    });
  }

  VisitsCompanion copyWith(
      {Value<int>? visitId,
      Value<int>? userId,
      Value<int>? patientId,
      Value<int>? protocolId,
      Value<DateTime>? visitDate,
      Value<String>? protocolData}) {
    return VisitsCompanion(
      visitId: visitId ?? this.visitId,
      userId: userId ?? this.userId,
      patientId: patientId ?? this.patientId,
      protocolId: protocolId ?? this.protocolId,
      visitDate: visitDate ?? this.visitDate,
      protocolData: protocolData ?? this.protocolData,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (visitId.present) {
      map['visit_id'] = Variable<int>(visitId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<int>(patientId.value);
    }
    if (protocolId.present) {
      map['protocol_id'] = Variable<int>(protocolId.value);
    }
    if (visitDate.present) {
      map['visit_date'] = Variable<DateTime>(visitDate.value);
    }
    if (protocolData.present) {
      map['protocol_data'] = Variable<String>(protocolData.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VisitsCompanion(')
          ..write('visitId: $visitId, ')
          ..write('userId: $userId, ')
          ..write('patientId: $patientId, ')
          ..write('protocolId: $protocolId, ')
          ..write('visitDate: $visitDate, ')
          ..write('protocolData: $protocolData')
          ..write(')'))
        .toString();
  }
}

class Images extends Table with TableInfo<Images, Image> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Images(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _imageIdMeta =
      const VerificationMeta('imageId');
  late final GeneratedColumn<int> imageId = GeneratedColumn<int>(
      'image_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints:
          'NOT NULL CONSTRAINT PK_images PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _widthMeta = const VerificationMeta('width');
  late final GeneratedColumn<int> width = GeneratedColumn<int>(
      'width', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
      'height', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _formatMeta = const VerificationMeta('format');
  late final GeneratedColumn<String> format = GeneratedColumn<String>(
      'format', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _imageDataMeta =
      const VerificationMeta('imageData');
  late final GeneratedColumn<Uint8List> imageData = GeneratedColumn<Uint8List>(
      'image_data', aliasedName, true,
      type: DriftSqlType.blob,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns =>
      [imageId, width, height, format, imageData];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'images';
  @override
  VerificationContext validateIntegrity(Insertable<Image> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('image_id')) {
      context.handle(_imageIdMeta,
          imageId.isAcceptableOrUnknown(data['image_id']!, _imageIdMeta));
    }
    if (data.containsKey('width')) {
      context.handle(
          _widthMeta, width.isAcceptableOrUnknown(data['width']!, _widthMeta));
    } else if (isInserting) {
      context.missing(_widthMeta);
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('format')) {
      context.handle(_formatMeta,
          format.isAcceptableOrUnknown(data['format']!, _formatMeta));
    } else if (isInserting) {
      context.missing(_formatMeta);
    }
    if (data.containsKey('image_data')) {
      context.handle(_imageDataMeta,
          imageData.isAcceptableOrUnknown(data['image_data']!, _imageDataMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {imageId};
  @override
  Image map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Image(
      imageId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}image_id'])!,
      width: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}width'])!,
      height: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}height'])!,
      format: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}format'])!,
      imageData: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}image_data']),
    );
  }

  @override
  Images createAlias(String alias) {
    return Images(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Image extends DataClass implements Insertable<Image> {
  final int imageId;
  final int width;
  final int height;
  final String format;
  final Uint8List? imageData;
  const Image(
      {required this.imageId,
      required this.width,
      required this.height,
      required this.format,
      this.imageData});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['image_id'] = Variable<int>(imageId);
    map['width'] = Variable<int>(width);
    map['height'] = Variable<int>(height);
    map['format'] = Variable<String>(format);
    if (!nullToAbsent || imageData != null) {
      map['image_data'] = Variable<Uint8List>(imageData);
    }
    return map;
  }

  ImagesCompanion toCompanion(bool nullToAbsent) {
    return ImagesCompanion(
      imageId: Value(imageId),
      width: Value(width),
      height: Value(height),
      format: Value(format),
      imageData: imageData == null && nullToAbsent
          ? const Value.absent()
          : Value(imageData),
    );
  }

  factory Image.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Image(
      imageId: serializer.fromJson<int>(json['image_id']),
      width: serializer.fromJson<int>(json['width']),
      height: serializer.fromJson<int>(json['height']),
      format: serializer.fromJson<String>(json['format']),
      imageData: serializer.fromJson<Uint8List?>(json['image_data']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'image_id': serializer.toJson<int>(imageId),
      'width': serializer.toJson<int>(width),
      'height': serializer.toJson<int>(height),
      'format': serializer.toJson<String>(format),
      'image_data': serializer.toJson<Uint8List?>(imageData),
    };
  }

  Image copyWith(
          {int? imageId,
          int? width,
          int? height,
          String? format,
          Value<Uint8List?> imageData = const Value.absent()}) =>
      Image(
        imageId: imageId ?? this.imageId,
        width: width ?? this.width,
        height: height ?? this.height,
        format: format ?? this.format,
        imageData: imageData.present ? imageData.value : this.imageData,
      );
  @override
  String toString() {
    return (StringBuffer('Image(')
          ..write('imageId: $imageId, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('format: $format, ')
          ..write('imageData: $imageData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      imageId, width, height, format, $driftBlobEquality.hash(imageData));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Image &&
          other.imageId == this.imageId &&
          other.width == this.width &&
          other.height == this.height &&
          other.format == this.format &&
          $driftBlobEquality.equals(other.imageData, this.imageData));
}

class ImagesCompanion extends UpdateCompanion<Image> {
  final Value<int> imageId;
  final Value<int> width;
  final Value<int> height;
  final Value<String> format;
  final Value<Uint8List?> imageData;
  const ImagesCompanion({
    this.imageId = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.format = const Value.absent(),
    this.imageData = const Value.absent(),
  });
  ImagesCompanion.insert({
    this.imageId = const Value.absent(),
    required int width,
    required int height,
    required String format,
    this.imageData = const Value.absent(),
  })  : width = Value(width),
        height = Value(height),
        format = Value(format);
  static Insertable<Image> custom({
    Expression<int>? imageId,
    Expression<int>? width,
    Expression<int>? height,
    Expression<String>? format,
    Expression<Uint8List>? imageData,
  }) {
    return RawValuesInsertable({
      if (imageId != null) 'image_id': imageId,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (format != null) 'format': format,
      if (imageData != null) 'image_data': imageData,
    });
  }

  ImagesCompanion copyWith(
      {Value<int>? imageId,
      Value<int>? width,
      Value<int>? height,
      Value<String>? format,
      Value<Uint8List?>? imageData}) {
    return ImagesCompanion(
      imageId: imageId ?? this.imageId,
      width: width ?? this.width,
      height: height ?? this.height,
      format: format ?? this.format,
      imageData: imageData ?? this.imageData,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (imageId.present) {
      map['image_id'] = Variable<int>(imageId.value);
    }
    if (width.present) {
      map['width'] = Variable<int>(width.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (format.present) {
      map['format'] = Variable<String>(format.value);
    }
    if (imageData.present) {
      map['image_data'] = Variable<Uint8List>(imageData.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImagesCompanion(')
          ..write('imageId: $imageId, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('format: $format, ')
          ..write('imageData: $imageData')
          ..write(')'))
        .toString();
  }
}

class Media extends Table with TableInfo<Media, MediaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Media(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mediaIdMeta =
      const VerificationMeta('mediaId');
  late final GeneratedColumn<int> mediaId = GeneratedColumn<int>(
      'media_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints:
          'NOT NULL CONSTRAINT PK_media PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _visitIdMeta =
      const VerificationMeta('visitId');
  late final GeneratedColumn<int> visitId = GeneratedColumn<int>(
      'visit_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _mediaTypeMeta =
      const VerificationMeta('mediaType');
  late final GeneratedColumn<int> mediaType = GeneratedColumn<int>(
      'media_type', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _imageIdMeta =
      const VerificationMeta('imageId');
  late final GeneratedColumn<int> imageId = GeneratedColumn<int>(
      'image_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _filePathMeta =
      const VerificationMeta('filePath');
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
      'file_path', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _thumbnailIdMeta =
      const VerificationMeta('thumbnailId');
  late final GeneratedColumn<int> thumbnailId = GeneratedColumn<int>(
      'thumbnail_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _listNumberMeta =
      const VerificationMeta('listNumber');
  late final GeneratedColumn<int> listNumber = GeneratedColumn<int>(
      'list_number', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _mediaDataMeta =
      const VerificationMeta('mediaData');
  late final GeneratedColumn<String> mediaData = GeneratedColumn<String>(
      'media_data', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _modificationMeta =
      const VerificationMeta('modification');
  late final GeneratedColumn<String> modification = GeneratedColumn<String>(
      'modification', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _reportDataMeta =
      const VerificationMeta('reportData');
  late final GeneratedColumn<String> reportData = GeneratedColumn<String>(
      'report_data', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        mediaId,
        visitId,
        mediaType,
        imageId,
        filePath,
        thumbnailId,
        listNumber,
        notes,
        mediaData,
        modification,
        reportData
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media';
  @override
  VerificationContext validateIntegrity(Insertable<MediaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('media_id')) {
      context.handle(_mediaIdMeta,
          mediaId.isAcceptableOrUnknown(data['media_id']!, _mediaIdMeta));
    }
    if (data.containsKey('visit_id')) {
      context.handle(_visitIdMeta,
          visitId.isAcceptableOrUnknown(data['visit_id']!, _visitIdMeta));
    } else if (isInserting) {
      context.missing(_visitIdMeta);
    }
    if (data.containsKey('media_type')) {
      context.handle(_mediaTypeMeta,
          mediaType.isAcceptableOrUnknown(data['media_type']!, _mediaTypeMeta));
    } else if (isInserting) {
      context.missing(_mediaTypeMeta);
    }
    if (data.containsKey('image_id')) {
      context.handle(_imageIdMeta,
          imageId.isAcceptableOrUnknown(data['image_id']!, _imageIdMeta));
    } else if (isInserting) {
      context.missing(_imageIdMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    }
    if (data.containsKey('thumbnail_id')) {
      context.handle(
          _thumbnailIdMeta,
          thumbnailId.isAcceptableOrUnknown(
              data['thumbnail_id']!, _thumbnailIdMeta));
    } else if (isInserting) {
      context.missing(_thumbnailIdMeta);
    }
    if (data.containsKey('list_number')) {
      context.handle(
          _listNumberMeta,
          listNumber.isAcceptableOrUnknown(
              data['list_number']!, _listNumberMeta));
    } else if (isInserting) {
      context.missing(_listNumberMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('media_data')) {
      context.handle(_mediaDataMeta,
          mediaData.isAcceptableOrUnknown(data['media_data']!, _mediaDataMeta));
    }
    if (data.containsKey('modification')) {
      context.handle(
          _modificationMeta,
          modification.isAcceptableOrUnknown(
              data['modification']!, _modificationMeta));
    }
    if (data.containsKey('report_data')) {
      context.handle(
          _reportDataMeta,
          reportData.isAcceptableOrUnknown(
              data['report_data']!, _reportDataMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mediaId};
  @override
  MediaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaData(
      mediaId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}media_id'])!,
      visitId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}visit_id'])!,
      mediaType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}media_type'])!,
      imageId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}image_id'])!,
      filePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_path']),
      thumbnailId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}thumbnail_id'])!,
      listNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}list_number'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      mediaData: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}media_data']),
      modification: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}modification']),
      reportData: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}report_data']),
    );
  }

  @override
  Media createAlias(String alias) {
    return Media(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'CONSTRAINT FK_media_visits_visit_id FOREIGN KEY(visit_id)REFERENCES visits(visit_id)',
        'CONSTRAINT FK_media_images_image_id FOREIGN KEY(image_id)REFERENCES images(image_id)',
        'CONSTRAINT FK_media_images_thumbnail_id FOREIGN KEY(thumbnail_id)REFERENCES images(image_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class MediaData extends DataClass implements Insertable<MediaData> {
  final int mediaId;
  final int visitId;
  final int mediaType;
  final int imageId;
  final String? filePath;
  final int thumbnailId;
  final int listNumber;
  final String? notes;
  final String? mediaData;
  final String? modification;
  final String? reportData;
  const MediaData(
      {required this.mediaId,
      required this.visitId,
      required this.mediaType,
      required this.imageId,
      this.filePath,
      required this.thumbnailId,
      required this.listNumber,
      this.notes,
      this.mediaData,
      this.modification,
      this.reportData});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['media_id'] = Variable<int>(mediaId);
    map['visit_id'] = Variable<int>(visitId);
    map['media_type'] = Variable<int>(mediaType);
    map['image_id'] = Variable<int>(imageId);
    if (!nullToAbsent || filePath != null) {
      map['file_path'] = Variable<String>(filePath);
    }
    map['thumbnail_id'] = Variable<int>(thumbnailId);
    map['list_number'] = Variable<int>(listNumber);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || mediaData != null) {
      map['media_data'] = Variable<String>(mediaData);
    }
    if (!nullToAbsent || modification != null) {
      map['modification'] = Variable<String>(modification);
    }
    if (!nullToAbsent || reportData != null) {
      map['report_data'] = Variable<String>(reportData);
    }
    return map;
  }

  MediaCompanion toCompanion(bool nullToAbsent) {
    return MediaCompanion(
      mediaId: Value(mediaId),
      visitId: Value(visitId),
      mediaType: Value(mediaType),
      imageId: Value(imageId),
      filePath: filePath == null && nullToAbsent
          ? const Value.absent()
          : Value(filePath),
      thumbnailId: Value(thumbnailId),
      listNumber: Value(listNumber),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      mediaData: mediaData == null && nullToAbsent
          ? const Value.absent()
          : Value(mediaData),
      modification: modification == null && nullToAbsent
          ? const Value.absent()
          : Value(modification),
      reportData: reportData == null && nullToAbsent
          ? const Value.absent()
          : Value(reportData),
    );
  }

  factory MediaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaData(
      mediaId: serializer.fromJson<int>(json['media_id']),
      visitId: serializer.fromJson<int>(json['visit_id']),
      mediaType: serializer.fromJson<int>(json['media_type']),
      imageId: serializer.fromJson<int>(json['image_id']),
      filePath: serializer.fromJson<String?>(json['file_path']),
      thumbnailId: serializer.fromJson<int>(json['thumbnail_id']),
      listNumber: serializer.fromJson<int>(json['list_number']),
      notes: serializer.fromJson<String?>(json['notes']),
      mediaData: serializer.fromJson<String?>(json['media_data']),
      modification: serializer.fromJson<String?>(json['modification']),
      reportData: serializer.fromJson<String?>(json['report_data']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'media_id': serializer.toJson<int>(mediaId),
      'visit_id': serializer.toJson<int>(visitId),
      'media_type': serializer.toJson<int>(mediaType),
      'image_id': serializer.toJson<int>(imageId),
      'file_path': serializer.toJson<String?>(filePath),
      'thumbnail_id': serializer.toJson<int>(thumbnailId),
      'list_number': serializer.toJson<int>(listNumber),
      'notes': serializer.toJson<String?>(notes),
      'media_data': serializer.toJson<String?>(mediaData),
      'modification': serializer.toJson<String?>(modification),
      'report_data': serializer.toJson<String?>(reportData),
    };
  }

  MediaData copyWith(
          {int? mediaId,
          int? visitId,
          int? mediaType,
          int? imageId,
          Value<String?> filePath = const Value.absent(),
          int? thumbnailId,
          int? listNumber,
          Value<String?> notes = const Value.absent(),
          Value<String?> mediaData = const Value.absent(),
          Value<String?> modification = const Value.absent(),
          Value<String?> reportData = const Value.absent()}) =>
      MediaData(
        mediaId: mediaId ?? this.mediaId,
        visitId: visitId ?? this.visitId,
        mediaType: mediaType ?? this.mediaType,
        imageId: imageId ?? this.imageId,
        filePath: filePath.present ? filePath.value : this.filePath,
        thumbnailId: thumbnailId ?? this.thumbnailId,
        listNumber: listNumber ?? this.listNumber,
        notes: notes.present ? notes.value : this.notes,
        mediaData: mediaData.present ? mediaData.value : this.mediaData,
        modification:
            modification.present ? modification.value : this.modification,
        reportData: reportData.present ? reportData.value : this.reportData,
      );
  @override
  String toString() {
    return (StringBuffer('MediaData(')
          ..write('mediaId: $mediaId, ')
          ..write('visitId: $visitId, ')
          ..write('mediaType: $mediaType, ')
          ..write('imageId: $imageId, ')
          ..write('filePath: $filePath, ')
          ..write('thumbnailId: $thumbnailId, ')
          ..write('listNumber: $listNumber, ')
          ..write('notes: $notes, ')
          ..write('mediaData: $mediaData, ')
          ..write('modification: $modification, ')
          ..write('reportData: $reportData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      mediaId,
      visitId,
      mediaType,
      imageId,
      filePath,
      thumbnailId,
      listNumber,
      notes,
      mediaData,
      modification,
      reportData);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaData &&
          other.mediaId == this.mediaId &&
          other.visitId == this.visitId &&
          other.mediaType == this.mediaType &&
          other.imageId == this.imageId &&
          other.filePath == this.filePath &&
          other.thumbnailId == this.thumbnailId &&
          other.listNumber == this.listNumber &&
          other.notes == this.notes &&
          other.mediaData == this.mediaData &&
          other.modification == this.modification &&
          other.reportData == this.reportData);
}

class MediaCompanion extends UpdateCompanion<MediaData> {
  final Value<int> mediaId;
  final Value<int> visitId;
  final Value<int> mediaType;
  final Value<int> imageId;
  final Value<String?> filePath;
  final Value<int> thumbnailId;
  final Value<int> listNumber;
  final Value<String?> notes;
  final Value<String?> mediaData;
  final Value<String?> modification;
  final Value<String?> reportData;
  const MediaCompanion({
    this.mediaId = const Value.absent(),
    this.visitId = const Value.absent(),
    this.mediaType = const Value.absent(),
    this.imageId = const Value.absent(),
    this.filePath = const Value.absent(),
    this.thumbnailId = const Value.absent(),
    this.listNumber = const Value.absent(),
    this.notes = const Value.absent(),
    this.mediaData = const Value.absent(),
    this.modification = const Value.absent(),
    this.reportData = const Value.absent(),
  });
  MediaCompanion.insert({
    this.mediaId = const Value.absent(),
    required int visitId,
    required int mediaType,
    required int imageId,
    this.filePath = const Value.absent(),
    required int thumbnailId,
    required int listNumber,
    this.notes = const Value.absent(),
    this.mediaData = const Value.absent(),
    this.modification = const Value.absent(),
    this.reportData = const Value.absent(),
  })  : visitId = Value(visitId),
        mediaType = Value(mediaType),
        imageId = Value(imageId),
        thumbnailId = Value(thumbnailId),
        listNumber = Value(listNumber);
  static Insertable<MediaData> custom({
    Expression<int>? mediaId,
    Expression<int>? visitId,
    Expression<int>? mediaType,
    Expression<int>? imageId,
    Expression<String>? filePath,
    Expression<int>? thumbnailId,
    Expression<int>? listNumber,
    Expression<String>? notes,
    Expression<String>? mediaData,
    Expression<String>? modification,
    Expression<String>? reportData,
  }) {
    return RawValuesInsertable({
      if (mediaId != null) 'media_id': mediaId,
      if (visitId != null) 'visit_id': visitId,
      if (mediaType != null) 'media_type': mediaType,
      if (imageId != null) 'image_id': imageId,
      if (filePath != null) 'file_path': filePath,
      if (thumbnailId != null) 'thumbnail_id': thumbnailId,
      if (listNumber != null) 'list_number': listNumber,
      if (notes != null) 'notes': notes,
      if (mediaData != null) 'media_data': mediaData,
      if (modification != null) 'modification': modification,
      if (reportData != null) 'report_data': reportData,
    });
  }

  MediaCompanion copyWith(
      {Value<int>? mediaId,
      Value<int>? visitId,
      Value<int>? mediaType,
      Value<int>? imageId,
      Value<String?>? filePath,
      Value<int>? thumbnailId,
      Value<int>? listNumber,
      Value<String?>? notes,
      Value<String?>? mediaData,
      Value<String?>? modification,
      Value<String?>? reportData}) {
    return MediaCompanion(
      mediaId: mediaId ?? this.mediaId,
      visitId: visitId ?? this.visitId,
      mediaType: mediaType ?? this.mediaType,
      imageId: imageId ?? this.imageId,
      filePath: filePath ?? this.filePath,
      thumbnailId: thumbnailId ?? this.thumbnailId,
      listNumber: listNumber ?? this.listNumber,
      notes: notes ?? this.notes,
      mediaData: mediaData ?? this.mediaData,
      modification: modification ?? this.modification,
      reportData: reportData ?? this.reportData,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mediaId.present) {
      map['media_id'] = Variable<int>(mediaId.value);
    }
    if (visitId.present) {
      map['visit_id'] = Variable<int>(visitId.value);
    }
    if (mediaType.present) {
      map['media_type'] = Variable<int>(mediaType.value);
    }
    if (imageId.present) {
      map['image_id'] = Variable<int>(imageId.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (thumbnailId.present) {
      map['thumbnail_id'] = Variable<int>(thumbnailId.value);
    }
    if (listNumber.present) {
      map['list_number'] = Variable<int>(listNumber.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (mediaData.present) {
      map['media_data'] = Variable<String>(mediaData.value);
    }
    if (modification.present) {
      map['modification'] = Variable<String>(modification.value);
    }
    if (reportData.present) {
      map['report_data'] = Variable<String>(reportData.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaCompanion(')
          ..write('mediaId: $mediaId, ')
          ..write('visitId: $visitId, ')
          ..write('mediaType: $mediaType, ')
          ..write('imageId: $imageId, ')
          ..write('filePath: $filePath, ')
          ..write('thumbnailId: $thumbnailId, ')
          ..write('listNumber: $listNumber, ')
          ..write('notes: $notes, ')
          ..write('mediaData: $mediaData, ')
          ..write('modification: $modification, ')
          ..write('reportData: $reportData')
          ..write(')'))
        .toString();
  }
}

class Atlases extends Table with TableInfo<Atlases, Atlas> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Atlases(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _atlasIdMeta =
      const VerificationMeta('atlasId');
  late final GeneratedColumn<int> atlasId = GeneratedColumn<int>(
      'atlas_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints:
          'NOT NULL CONSTRAINT PK_atlases PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _treeMeta = const VerificationMeta('tree');
  late final GeneratedColumn<String> tree = GeneratedColumn<String>(
      'tree', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _isPublicMeta =
      const VerificationMeta('isPublic');
  late final GeneratedColumn<int> isPublic = GeneratedColumn<int>(
      'is_public', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [atlasId, userId, title, tree, isPublic];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'atlases';
  @override
  VerificationContext validateIntegrity(Insertable<Atlas> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('atlas_id')) {
      context.handle(_atlasIdMeta,
          atlasId.isAcceptableOrUnknown(data['atlas_id']!, _atlasIdMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('tree')) {
      context.handle(
          _treeMeta, tree.isAcceptableOrUnknown(data['tree']!, _treeMeta));
    } else if (isInserting) {
      context.missing(_treeMeta);
    }
    if (data.containsKey('is_public')) {
      context.handle(_isPublicMeta,
          isPublic.isAcceptableOrUnknown(data['is_public']!, _isPublicMeta));
    } else if (isInserting) {
      context.missing(_isPublicMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {atlasId};
  @override
  Atlas map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Atlas(
      atlasId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}atlas_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      tree: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tree'])!,
      isPublic: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_public'])!,
    );
  }

  @override
  Atlases createAlias(String alias) {
    return Atlases(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'CONSTRAINT FK_atlases_users_user_id FOREIGN KEY(user_id)REFERENCES users(user_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class Atlas extends DataClass implements Insertable<Atlas> {
  final int atlasId;
  final int userId;
  final String title;
  final String tree;
  final int isPublic;
  const Atlas(
      {required this.atlasId,
      required this.userId,
      required this.title,
      required this.tree,
      required this.isPublic});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['atlas_id'] = Variable<int>(atlasId);
    map['user_id'] = Variable<int>(userId);
    map['title'] = Variable<String>(title);
    map['tree'] = Variable<String>(tree);
    map['is_public'] = Variable<int>(isPublic);
    return map;
  }

  AtlasesCompanion toCompanion(bool nullToAbsent) {
    return AtlasesCompanion(
      atlasId: Value(atlasId),
      userId: Value(userId),
      title: Value(title),
      tree: Value(tree),
      isPublic: Value(isPublic),
    );
  }

  factory Atlas.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Atlas(
      atlasId: serializer.fromJson<int>(json['atlas_id']),
      userId: serializer.fromJson<int>(json['user_id']),
      title: serializer.fromJson<String>(json['title']),
      tree: serializer.fromJson<String>(json['tree']),
      isPublic: serializer.fromJson<int>(json['is_public']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'atlas_id': serializer.toJson<int>(atlasId),
      'user_id': serializer.toJson<int>(userId),
      'title': serializer.toJson<String>(title),
      'tree': serializer.toJson<String>(tree),
      'is_public': serializer.toJson<int>(isPublic),
    };
  }

  Atlas copyWith(
          {int? atlasId,
          int? userId,
          String? title,
          String? tree,
          int? isPublic}) =>
      Atlas(
        atlasId: atlasId ?? this.atlasId,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        tree: tree ?? this.tree,
        isPublic: isPublic ?? this.isPublic,
      );
  @override
  String toString() {
    return (StringBuffer('Atlas(')
          ..write('atlasId: $atlasId, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('tree: $tree, ')
          ..write('isPublic: $isPublic')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(atlasId, userId, title, tree, isPublic);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Atlas &&
          other.atlasId == this.atlasId &&
          other.userId == this.userId &&
          other.title == this.title &&
          other.tree == this.tree &&
          other.isPublic == this.isPublic);
}

class AtlasesCompanion extends UpdateCompanion<Atlas> {
  final Value<int> atlasId;
  final Value<int> userId;
  final Value<String> title;
  final Value<String> tree;
  final Value<int> isPublic;
  const AtlasesCompanion({
    this.atlasId = const Value.absent(),
    this.userId = const Value.absent(),
    this.title = const Value.absent(),
    this.tree = const Value.absent(),
    this.isPublic = const Value.absent(),
  });
  AtlasesCompanion.insert({
    this.atlasId = const Value.absent(),
    required int userId,
    required String title,
    required String tree,
    required int isPublic,
  })  : userId = Value(userId),
        title = Value(title),
        tree = Value(tree),
        isPublic = Value(isPublic);
  static Insertable<Atlas> custom({
    Expression<int>? atlasId,
    Expression<int>? userId,
    Expression<String>? title,
    Expression<String>? tree,
    Expression<int>? isPublic,
  }) {
    return RawValuesInsertable({
      if (atlasId != null) 'atlas_id': atlasId,
      if (userId != null) 'user_id': userId,
      if (title != null) 'title': title,
      if (tree != null) 'tree': tree,
      if (isPublic != null) 'is_public': isPublic,
    });
  }

  AtlasesCompanion copyWith(
      {Value<int>? atlasId,
      Value<int>? userId,
      Value<String>? title,
      Value<String>? tree,
      Value<int>? isPublic}) {
    return AtlasesCompanion(
      atlasId: atlasId ?? this.atlasId,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      tree: tree ?? this.tree,
      isPublic: isPublic ?? this.isPublic,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (atlasId.present) {
      map['atlas_id'] = Variable<int>(atlasId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (tree.present) {
      map['tree'] = Variable<String>(tree.value);
    }
    if (isPublic.present) {
      map['is_public'] = Variable<int>(isPublic.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AtlasesCompanion(')
          ..write('atlasId: $atlasId, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('tree: $tree, ')
          ..write('isPublic: $isPublic')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final Roles roles = Roles(this);
  late final Permissions permissions = Permissions(this);
  late final Users users = Users(this);
  late final Settings settings = Settings(this);
  late final Index iXSettingsUserId = Index('IX_settings_user_id',
      'CREATE INDEX IX_settings_user_id ON settings (user_id)');
  late final Patients patients = Patients(this);
  late final Index iXPatientsUserId = Index('IX_patients_user_id',
      'CREATE INDEX IX_patients_user_id ON patients (user_id)');
  late final Protocols protocols = Protocols(this);
  late final Visits visits = Visits(this);
  late final Index iXVisitsUserId = Index('IX_visits_user_id',
      'CREATE INDEX IX_visits_user_id ON visits (user_id)');
  late final Index iXVisitsPatientId = Index('IX_visits_patient_id',
      'CREATE INDEX IX_visits_patient_id ON visits (patient_id)');
  late final Images images = Images(this);
  late final Media media = Media(this);
  late final Index iXMediaVisitId = Index('IX_media_visit_id',
      'CREATE INDEX IX_media_visit_id ON media (visit_id)');
  late final Atlases atlases = Atlases(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        roles,
        permissions,
        users,
        settings,
        iXSettingsUserId,
        patients,
        iXPatientsUserId,
        protocols,
        visits,
        iXVisitsUserId,
        iXVisitsPatientId,
        images,
        media,
        iXMediaVisitId,
        atlases
      ];
}
