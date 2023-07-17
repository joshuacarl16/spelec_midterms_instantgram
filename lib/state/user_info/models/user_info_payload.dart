import 'dart:collection' show MapView;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:spelec_midterms1/state/constants/firebase_field_name.dart';
import 'package:spelec_midterms1/state/posts/typedefs/user_id.dart';

@immutable
class UserInfoPayload extends MapView<String, String> {
  UserInfoPayload({
    required UserId userId,
    required String? displayName,
    required String? email,
  }) : super(
          {
            FirebaseFieldName.userId: userId,
            FirebaseFieldName.displayName: displayName ?? '',
            FirebaseFieldName.email: email ?? '',
          },
        );
}
