import 'package:flutter/cupertino.dart';
import 'package:manage_my_store/repositories/storage/web_storage_repository.dart';

import '../../utils/Resource.dart';

class WebStorageViewModel with ChangeNotifier {
  final WebStorageRepository repository =  WebStorageRepository();

  Future<Resources<String>> saveImage(String imagePath) async {
    return repository.saveImage(imagePath);
  }
}