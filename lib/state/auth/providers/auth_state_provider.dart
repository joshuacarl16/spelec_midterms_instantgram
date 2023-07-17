import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spelec_midterms1/state/auth/models/auth_state.dart';
import 'package:spelec_midterms1/state/auth/notifiers/auth_state_notifier.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (_) => AuthStateNotifier(),
);
