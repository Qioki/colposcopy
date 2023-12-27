import 'dart:convert';

import 'package:colposcopy/core/utils/file_helper.dart';
import 'package:colposcopy/core/utils/file_paths.dart';
import 'package:colposcopy/data/datasources/base/visits.dart';
import 'package:colposcopy/domain/models/protocol/protocol.dart';
import 'package:colposcopy/domain/repositories/protocols.dart';
import 'package:colposcopy/features/form_engine/domain/models/form_item_data/form_item_data.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: ProtocolRepository)
class ProtocolRepositoryImpl extends ProtocolRepository {
  ProtocolRepositoryImpl(this._datasource, this._logger);
  final VisitsDatasource _datasource;
  final Logger _logger;

  FormItemData protocolScheme = const FormItemData();

  final int defaultProtocolId = 1;

  @postConstruct
  void init() {
    initProtocolScheme(defaultProtocolId);
  }

  void initProtocolScheme(int id) async {
    try {
      var protocol = await _datasource.getProtocolById(id);

      Map<String, dynamic> json = {};

      if (protocol == null) {
        json = await loadProtocolFromAsset();
        await _datasource
            .addProtocol(Protocol(state: 1, scheme: jsonEncode(json)));
      } else {
        json = jsonDecode(protocol.scheme);
      }
      protocolScheme = FormItemData.fromJson(json);
    } catch (e) {
      _logger.e(e);

      protocolScheme = const FormItemData();
    }
  }

  Future<Map<String, dynamic>> loadProtocolFromAsset() async {
    try {
      var json =
          await FileHelper.readJsonFile(FilePaths.pathToDefaultProtocolJson);

      // print(json);
      return json;
    } catch (e) {
      _logger.e(e);
    }
    return {};
  }

  @override
  Future<Protocol?> getProtocolById(int id) => _datasource.getProtocolById(id);

  @override
  Future<int> addProtocol(Protocol item) => _datasource.addProtocol(item);

  @override
  Future<void> deleteProtocolWithId(int id) =>
      _datasource.deleteProtocolWithId(id);

  @override
  Future<void> updateProtocol(Protocol item) =>
      _datasource.updateProtocol(item);
}
