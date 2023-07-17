import 'dart:collection' show MapView;

import 'package:flutter/foundation.dart' show immutable;
import 'package:spelec_midterms1/state/constants/firebase_field_name.dart';
import 'package:spelec_midterms1/state/posts/typedefs/post_id.dart';
import 'package:spelec_midterms1/state/posts/typedefs/user_id.dart';

@immutable
class Like extends MapView<String, String> {
  Like({
    required PostId postId,
    required UserId likedBy,
    required DateTime date,
  }) : super(
          {
            FirebaseFieldName.postId: postId,
            FirebaseFieldName.userId: likedBy,
            FirebaseFieldName.date: date.toIso8601String(),
          },
        );
}
