import 'package:colposcopy/domain/models/protocol/protocol.dart';

abstract class ProtocolRepository {
  Future<Protocol?> getProtocolById(int id);
  Future<int> addProtocol(Protocol item);
  Future<void> deleteProtocolWithId(int id);
  Future<void> updateProtocol(Protocol item);

  Map<String, dynamic> getProtocolJson();
  Map<String, dynamic> getPatientCardJson();
}
