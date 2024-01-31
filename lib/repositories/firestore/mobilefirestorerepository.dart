import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:manage_my_store/model/user.dart';
import 'package:manage_my_store/utils/Resource.dart';

class MobileFireStoreRepository {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;

  Future<Resources<bool>> addUserIntoUserList(FirebaseUser user) async {
    try {
      Loading<bool> loadingState = Loading();
      Map<String, dynamic> userData = user.toJson();

      await db.collection("users").doc(firebaseAuth.currentUser?.uid).set(userData);
      Success<bool> successState = Success(true);
      return successState; // Return success state if needed
    } catch (e) {
      Error<bool> errorState = Error(e.toString());
      return errorState; // Return error state if needed
    }
  }

}
