import 'package:manage_my_store/model/web/store_owner.dart';

class FirebaseStore {
  final FirebaseStoreOwner storeOwner;
  final String storeName;
  final String storeAddress;

  FirebaseStore(
      this.storeOwner, this.storeName, this.storeAddress);

  FirebaseStore.fromJson(Map<String?, dynamic> json)
      : storeOwner = json['storeOwner'] as FirebaseStoreOwner,
        storeName = json['storeName'] as String,
        storeAddress = json['storeAddress'] as String;

  Map<String, dynamic> toJson() => {
        'storeOwner': storeOwner,
        'storeName': storeName,
        'storeAddress': storeAddress
      };


}
