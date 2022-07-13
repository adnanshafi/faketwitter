import 'package:cloud_firestore/cloud_firestore.dart';

/// Common Wrapper for all store endpoints
class Store {
  Store(FirebaseFirestore store)
      : _store = store,
        userStore = UserStore(store);

  /// Instance of FirebaseFirestore
  final FirebaseFirestore _store;

  /// Instance of UserStore
  /// Encapsulates all UserStore endpoints
  final UserStore userStore;
}

class UserStore {
  const UserStore(FirebaseFirestore store) : _store = store;

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

  /// [tempUserDataCollectionReference] : Collection to store temporary user data
  /// for new users without login
  ///
  /// This temp document gets copied to /user_data/ after auth
  ///
  /// /temp_user_data/{auto-id}
  CollectionReference get tempUserDataCollectionReference =>
      _store.collection('temp_user_data');

  /// doc from tempUserData collection
  /// [docId] : documentId of document
  /// /temp_user_data/{docId}
  DocumentReference tempUserDataDocumentReference(String docId) {
    return tempUserDataCollectionReference.doc(docId);
  }
}
