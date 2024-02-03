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

      await db
          .collection("users")
          .doc(firebaseAuth.currentUser?.uid)
          .set(userData);
      Success<bool> successState = Success(true);
      return successState; // Return success state if needed
    } catch (e) {
      Error<bool> errorState = Error(e.toString());
      return errorState; // Return error state if needed
    }
  }

  Future<Resources<String>> checkUserOrAdmin(String userID) async {
    try {
      var documentSnapshot = await db.collection("users").doc(userID).get();

      if (documentSnapshot.exists) {
        // Document exists, return its ID
        Success<String> successState = Success(documentSnapshot.id);
        return successState;
      } else {
        // Document does not exist
        Error<String> errorState = Error("This is not valid User. Use Website for Admin login");
        return errorState;
      }
    } catch (e) {
      // Handle any other errors
      Error<String> errorState = Error(e.toString());
      return errorState;
    }
  }
}
