import 'package:colposcopy/data/datasources/drift/database/database.dart';
import 'package:colposcopy/domain/models/visit/visit.dart' as model;
import 'package:colposcopy/domain/models/media/media.dart' as model;
import 'package:colposcopy/domain/models/image/image.dart' as model;
import 'package:colposcopy/domain/models/protocol/protocol.dart' as model;

// VisitMapper
class VisitMapper {
  static model.Visit toModel(Visit entity) => model.Visit(
        visitId: entity.visitId,
        patientId: entity.patientId,
        userId: entity.userId,
        protocolId: entity.protocolId,
        protocolData: entity.protocolData,
        visitDate: entity.visitDate,
      );

  static List<model.Visit> toModelList(List<Visit> entities) =>
      entities.map(toModel).toList();

  static Visit toEntity(model.Visit model) => Visit(
        visitId: model.visitId,
        patientId: model.patientId,
        userId: model.userId,
        protocolId: model.protocolId,
        protocolData: model.protocolData,
        visitDate: model.visitDate,
      );
}

// MediaMapper
class MediaMapper {
  static model.Media toModel(MediaData entity) => model.Media(
        mediaId: entity.mediaId,
        visitId: entity.visitId,
        mediaType: entity.mediaType,
        mediaData: entity.mediaData,
        imageId: entity.imageId,
        thumbnailId: entity.thumbnailId,
        listNumber: entity.listNumber,
      );

  static List<model.Media> toModelList(List<MediaData> entities) =>
      entities.map(toModel).toList();

  static MediaData toEntity(model.Media model) => MediaData(
        mediaId: model.mediaId ?? 0,
        visitId: model.visitId,
        mediaType: model.mediaType,
        mediaData: model.mediaData,
        imageId: model.imageId,
        thumbnailId: model.thumbnailId,
        listNumber: model.listNumber,
      );
}

// ImageMapper
class ImageMapper {
  static model.Image toModel(Image entity) => model.Image(
        imageId: entity.imageId,
        width: entity.width,
        height: entity.height,
        format: entity.format,
        imageData: entity.imageData,
      );

  static List<model.Image> toModelList(List<Image> entities) =>
      entities.map(toModel).toList();

  static Image toEntity(model.Image model) => Image(
        imageId: model.imageId ?? 0,
        width: model.width,
        height: model.height,
        format: model.format,
        imageData: model.imageData,
      );
}

//ProtocolMapper
class ProtocolMapper {
  static model.Protocol toModel(Protocol entity) => model.Protocol(
        protocolId: entity.protocolId,
        userId: entity.userId ?? 0,
        state: entity.state,
        scheme: entity.scheme,
      );

  static List<model.Protocol> toModelList(List<Protocol> entities) =>
      entities.map(toModel).toList();

  static Protocol toEntity(model.Protocol model) => Protocol(
        protocolId: model.protocolId ?? 0,
        userId: model.userId,
        state: model.state,
        scheme: model.scheme,
      );
}
