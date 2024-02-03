class FirebaseStore {
  final String name;
  final String email;
  final String phoneNum;
  final String storeName;
  final String storeAddress;

  FirebaseStore(
      this.name, this.email, this.phoneNum, this.storeName, this.storeAddress);

  FirebaseStore.fromJson(Map<String?, dynamic> json)
      : name = json['name'] as String,
        email = json['email'] as String,
        phoneNum = json['phoneNum'] as String,
        storeName = json['storeName'] as String,
        storeAddress = json['storeAddress'] as String;

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phoneNum': phoneNum,
        'storeName': storeName,
        'storeAddress': storeAddress
      };
}
