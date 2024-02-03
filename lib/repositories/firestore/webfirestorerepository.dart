import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:manage_my_store/model/store.dart';
import 'package:manage_my_store/utils/Resource.dart';

class WebFireStoreRepository {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;

  Future<Resources<bool>> addStoreIntoStoreList(FirebaseStore store) async {
    try {
      Loading<bool> loadingState = Loading();
      Map<String, dynamic> storeData = store.toJson();
      await db.collection("store").doc(firebaseAuth.currentUser?.uid).set(storeData);
      Success<bool> successState = Success(true);
      return successState; // Return success state if needed
    } catch (e) {
      Error<bool> errorState = Error(e.toString());
      return errorState; // Return error state if needed
    }
  }

  Future<Resources<String>> checkUserOrAdmin(String userID) async {
    try {
      var documentSnapshot = await db.collection("store").doc(userID).get();

      if (documentSnapshot.exists) {
        // Document exists, return its ID
        Success<String> successState = Success(documentSnapshot.id);
        return successState;
      } else {
        // Document does not exist
        Error<String> errorState = Error("This is not valid Store. Use App for User login");
        return errorState;
      }
    } catch (e) {
      // Handle any other errors
      Error<String> errorState = Error(e.toString());
      return errorState;
    }
  }

}
