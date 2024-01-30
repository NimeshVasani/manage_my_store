class FirebaseUser {
  final String? name;
  final String email;
  final String? phoneNum;


  FirebaseUser(this.name, this.email,this.phoneNum);

  FirebaseUser.fromJson(Map<String?, dynamic> json)
      : name = json['name'] as String?,
        email = json['email'] as String,
        phoneNum = json['phoneNum'] as String?;

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password':phoneNum
  };
}