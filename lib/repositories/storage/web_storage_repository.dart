import 'dart:convert';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:manage_my_store/utils/Resource.dart';
import 'package:uuid/uuid.dart';

class WebStorageRepository {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final firebaseAuth = FirebaseAuth.instance;

  Future<Resources<String>> saveImage(String imagePath) async {
    try {
      // Generate a unique filename for the image
      String uniqueFileName = firebaseAuth.currentUser!.uid.toString();
      String imageName = const Uuid().v1();

      // Reference to the image path in Firebase Storage
      Reference storageRef = _storage.ref().child('images/$uniqueFileName/$imageName');
      Uint8List bytes = base64Decode(imagePath);
      // Upload the image to Firebase Storage
      await storageRef.putData(bytes);

      // Get the download URL of the uploaded image
      String downloadUrl = await storageRef.getDownloadURL();

      // In this example, we return a list containing the download URL
      var returnData = Success(downloadUrl);

      return returnData;
    } catch (e) {
      // Return an error state if an exception occurs
      return Error(e.toString());
    }
  }




}
