import 'package:flutter/cupertino.dart';
import 'package:manage_my_store/model/user.dart';
import 'package:manage_my_store/repositories/firestore/mobilefirestorerepository.dart';

import '../../utils/Resource.dart';

class FireStoreViewModel with ChangeNotifier{

  final _fireStoreRepository = MobileFireStoreRepository();

  Future<Resources<bool>> addUserIntoUserList(FirebaseUser user) async{
    return await _fireStoreRepository.addUserIntoUserList(user);
  }
}