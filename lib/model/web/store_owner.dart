class FirebaseStoreOwner {
  final String name;
  final String email;
  final String phoneNum;

  FirebaseStoreOwner(this.name, this.email, this.phoneNum);

  FirebaseStoreOwner.fromJson(Map<String?, dynamic> json)
      : name = json['name'] as String,
        email = json['email'] as String,
        phoneNum = json['phoneNum'] as String;

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'phoneNum': phoneNum,
  };
}
