import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:models/models.dart';
import 'package:mem_cache/mem_cache.dart';

part 'store.dart';

/// Api to do all Firebase Ops
class FakeTwitterApi {
  FakeTwitterApi(FirebaseFirestore store, MemCache cache)
      : _store = _Store(store),
        _cache = cache;

  final _Store _store;
  final MemCache _cache;

  Future<void> setUserData(
    UserData userData, {
    String uid = '',
    Function(String s)? onFailure,
    Function()? onSuccess,
  }) async {
    String _uid = uid.isEmpty ? userData.uid : uid;

    try {
      await _store.userStore
          .userDataDocumentReference(_uid)
          .set(userData.toJson());

      if (onSuccess != null) onSuccess();
    } on FirebaseException catch (e) {
      if (onFailure != null) onFailure(errorMessageStore);
    } on Exception catch (e) {
      if (onFailure != null) onFailure(errorMessageGeneral);
    }
  }

  Future<UserData> getUserData(
    String uid, {
    Function(String s)? onFailure,
    Function()? onSuccess,
  }) async {
    try {
      final response =
          await _store.userStore.userDataDocumentReference(uid).get();
      // if not exists >> send back empty
      if (!response.exists) {
        return UserData.empty;
      }

      // Parse response
      final userData = UserData.fromJson(response.data() as Json);

      // return UserData
      return userData;
    } on FirebaseException catch (e) {
      if (onFailure != null) onFailure(errorMessageStore);
      return UserData.empty;
    } on Exception catch (e) {
      if (onFailure != null) onFailure(errorMessageGeneral);
      return UserData.empty;
    }
  }

  /// Check if `username` is Avaialable
  /// Add Error Handling
  Future<bool> checkUsernameAvailability(String username) async {
    final response =
        await _store.userStore.userDataWithUsername(username).get();
    if (response.docs.isEmpty) {
      return true;
    }
    return false;
  }

  Future<void> setTweet(
    Tweet tweet, {
    Function()? onSuccess,
    Function(String message)? onFailure,
  }) async {
    try {
      await _store.tweetStore.tweetsCollectionReference.add(tweet.toJson());
      if (onSuccess != null) onSuccess();
    } on FirebaseException catch (e) {
      if (onFailure != null) onFailure(e.code);
    } on Exception {
      if (onFailure != null) onFailure('Something went wrong');
    }
  }

  Future<List<Tweet>> getRecentTweetsByUser(String uid) async {
    final response = await _store.tweetStore.getTweetsByUser(uid).get();
    final tweets = response.docs.map(
      (r) {
        return Tweet.fromJson(
          r.data() as Json,
          storePath: r.reference.path,
        );
      },
    ).toList();
    return tweets;
  }
}

const String errorMessageStore = 'Something Wrong With Server!';
const String errorMessageGeneral = 'Something else went wrong';

typedef Json = Map<String, dynamic>;
