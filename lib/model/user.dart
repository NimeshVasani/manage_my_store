class FirebaseUser {
  final String? name;
  final String email;
  final String? phoneNum;
  final List<String>? favoriteItems;


  FirebaseUser(this.name, this.email,this.phoneNum, this.favoriteItems);

  FirebaseUser.fromJson(Map<String?, dynamic> json)
      : name = json['name'] as String?,
        email = json['email'] as String,
        phoneNum = json['phoneNum'] as String?,
        favoriteItems = json['favoriteItems'] as List<String>;

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'phoneNum':phoneNum,
    'favoriteItems' :favoriteItems
  };
}