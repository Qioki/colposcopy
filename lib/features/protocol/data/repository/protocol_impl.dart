import 'dart:convert';

import 'package:colposcopy/core/utils/file_helper.dart';
import 'package:colposcopy/core/utils/file_paths.dart';
import 'package:colposcopy/data/datasources/base/visits.dart';
import 'package:colposcopy/domain/models/protocol/protocol.dart';
import 'package:colposcopy/domain/repositories/protocols.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: ProtocolRepository)
class ProtocolRepositoryImpl extends ProtocolRepository {
  ProtocolRepositoryImpl(this._datasource, this._logger);
  final VisitsDatasource _datasource;
  final Logger _logger;

  Map<String, dynamic> protocolJson = {};
  Map<String, dynamic> patientCardJson = {};

  final int defaultProtocolId = 1;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    //TODO: async
    await initProtocolScheme(defaultProtocolId);
    await initPatientCardScheme();
  }

  Future<void> initProtocolScheme(int id) async {
    try {
      var protocol = await _datasource.getProtocolById(id);

      Map<String, dynamic> json = {};

      if (protocol == null) {
        protocolJson =
            await FileHelper.readJsonFile(FilePaths.pathToDefaultProtocolJson);
        await _datasource
            .addProtocol(Protocol(state: 1, scheme: jsonEncode(json)));
      } else {
        protocolJson = jsonDecode(protocol.scheme);
      }
    } catch (e) {
      _logger.e(e);
    }
  }

  Future<void> initPatientCardScheme() async {
    try {
      patientCardJson =
          await FileHelper.readJsonFile(FilePaths.pathToDefaultPatientCardJson);
    } catch (e) {
      _logger.e(e);
      patientCardJson = {};
    }
  }

  @override
  Map<String, dynamic> getProtocolJson() => protocolJson;
  @override
  Map<String, dynamic> getPatientCardJson() => patientCardJson;

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
