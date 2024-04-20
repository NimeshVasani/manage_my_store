import 'package:manage_my_store/model/web/store_owner.dart';

import 'item.dart';

class FirebaseStore {
  final FirebaseStoreOwner? storeOwner;
  final String? storeName;
  final String? storeAddress;
  final List<FirebaseItem>? items;

  FirebaseStore(this.storeOwner, this.storeName, this.storeAddress, this.items);

  FirebaseStore.fromJson(Map<String, dynamic> json)
      : storeOwner = FirebaseStoreOwner.fromJson(json['storeOwner']),
        storeName = json['storeName'] as String,
        storeAddress = json['storeAddress'] as String,
        items = (json['items'] as List<dynamic>)
            .map((itemJson) => FirebaseItem.fromJson(itemJson))
            .toList();

  Map<String, dynamic> toJson() => {
    'storeOwner': storeOwner?.toJson(),
    'storeName': storeName,
    'storeAddress': storeAddress,
    'items': items?.map((item) => item.toJson()).toList(),
  };
}
