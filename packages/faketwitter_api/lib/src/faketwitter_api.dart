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

  Future<void> setUserData(UserData userData, {String uid = ''}) async {
    String _uid = uid.isEmpty ? userData.uid : uid;
    await _store.userStore
        .userDataDocumentReference(_uid)
        .set(userData.toJson());
  }
}
