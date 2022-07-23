part of 'faketwitter_api.dart';

/// Common Wrapper for all store endpoints
class _Store {
  _Store(FirebaseFirestore store)
      : _store = store,
        userStore = _UserStore(store);

  /// Instance of FirebaseFirestore
  final FirebaseFirestore _store;

  /// Instance of UserStore
  /// Encapsulates all UserStore endpoints
  final _UserStore userStore;
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
}
