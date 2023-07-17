import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spelec_midterms1/state/auth/models/auth_result.dart';
import 'package:spelec_midterms1/state/auth/providers/auth_state_provider.dart';

final isLoggedInProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.result == AuthResult.success;
});
