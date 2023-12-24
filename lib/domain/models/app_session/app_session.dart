import 'package:colposcopy/domain/models/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_session.freezed.dart';
// part 'app_session.g.dart';

@freezed
class AppSession with _$AppSession {
  const factory AppSession.initial() = _Initial;
  const factory AppSession.loggedIn({
    required User currentUser,
  }) = _LoggedIn;
}
