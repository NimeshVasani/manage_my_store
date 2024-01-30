import 'package:flutter/cupertino.dart';
import 'package:manage_my_store/model/user.dart';
import 'package:manage_my_store/repositories/firestore/firestorerepository.dart';

import '../../utils/Resource.dart';

class FireStoreViewModel with ChangeNotifier{

  final _fireStoreRepository = FireStoreRepository();

  Future<Resources<bool>> addUserIntoUserList(FirebaseUser user) async{
    return await _fireStoreRepository.addUserIntoUserList(user);
  }
}