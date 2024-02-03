import 'package:flutter/cupertino.dart';
import 'package:manage_my_store/model/store.dart';
import '../../repositories/firestore/webfirestorerepository.dart';
import '../../utils/Resource.dart';

class WebFireStoreViewModel with ChangeNotifier {
  final _fireStoreRepository = WebFireStoreRepository();

  Future<Resources<bool>> addStoreIntoStoreList(FirebaseStore store) async {
    return await _fireStoreRepository.addStoreIntoStoreList(store);
  }

  Future<Resources<String>> checkUserOrAdmin(String userID) async {
    return await _fireStoreRepository.checkUserOrAdmin(userID);
  }
}
