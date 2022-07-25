part of 'faketwitter_api.dart';

/// Common Wrapper for all store endpoints
class _Store {
  _Store(FirebaseFirestore store)
      : _store = store,
        userStore = _UserStore(store),
        tweetStore = _TweetStore(store);

  /// Instance of FirebaseFirestore
  final FirebaseFirestore _store;

  /// Instance of UserStore
  /// Encapsulates all UserStore endpoints
  final _UserStore userStore;
  final _TweetStore tweetStore;
}

class _UserStore {
  const _UserStore(FirebaseFirestore store) : _store = store;

  /// Instance Of FirebaseFirestore
  final FirebaseFirestore _store;

  /// [userDataCollectionReference] : Collection for UserData
  /// /user_data/
  /// document stored in store by doc name uid : /user_data/{uid}
  CollectionReference get userDataCollectionReference =>
      _store.collection('user_data');

  /// Returns DocumentReference for UserData of User with [uid]
  /// /user_data/[uid]
  DocumentReference userDataDocumentReference(String uid) {
    return userDataCollectionReference.doc(uid);
  }

  /// Query UserData with `username`
  /// /user_data/{where username == username}
  Query userDataWithUsername(String username) {
    return userDataCollectionReference.where(
      UserDataKeys.keyUsername,
      isEqualTo: username,
    );
  }
}

class _TweetStore {
  const _TweetStore(this._store);

  final FirebaseFirestore _store;

  CollectionReference get tweetsCollectionReference {
    return _store.collection('tweets');
  }

  DocumentReference getTweetDocumentReferenceByID(String tweetId) {
    return tweetsCollectionReference.doc(tweetId);
  }
}
