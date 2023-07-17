import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:spelec_midterms1/state/constants/firebase_collection_name.dart';
import 'package:spelec_midterms1/state/constants/firebase_field_name.dart';
import 'package:spelec_midterms1/state/posts/typedefs/user_id.dart';
import 'package:spelec_midterms1/state/user_info/models/user_info_payload.dart';

@immutable
class UserInfoStorage {
  const UserInfoStorage();
  Future<bool> saveUserInfo({
    required UserId userId,
    required String displayName,
    required String? email,
  }) async {
    try {
      //first check if we have user's info from before
      final userInfo = await FirebaseFirestore.instance
          .collection(
            FirebaseCollectionName.users,
          )
          .where(
            FirebaseFieldName.userId,
            isEqualTo: userId,
          )
          .limit(1)
          .get();

      if (userInfo.docs.isNotEmpty) {
        await userInfo.docs.first.reference.update({
          FirebaseFieldName.displayName: displayName,
          FirebaseFieldName.email: email ?? '',
        });
        return true;
      }

      //we don't have user's info from before, create new user
      final payload = UserInfoPayload(
          userId: userId, displayName: displayName, email: email);
      await FirebaseFirestore.instance
          .collection(
            FirebaseCollectionName.users,
          )
          .add(
            payload,
          );
      return true;
    } catch (e) {
      return false;
    }
  }
}
