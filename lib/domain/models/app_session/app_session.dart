import 'package:colposcopy/domain/models/patient/patient.dart';
import 'package:colposcopy/domain/models/user/user.dart';
import 'package:colposcopy/domain/models/visit/visit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_session.freezed.dart';
// part 'app_session.g.dart';

@Freezed(equal: false, toStringOverride: false)
class AppSession with _$AppSession {
  const factory AppSession.inactive() = InactiveAppSession;
  const factory AppSession.active({
    required User currentUser,
    Patient? currentPatient,
    Visit? currentVisit,
  }) = ActiveAppSession;
}
