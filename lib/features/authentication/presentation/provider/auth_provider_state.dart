import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_provider_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    required String verificationId,
    required int? resendToken,
  }) = _AuthState;
}
