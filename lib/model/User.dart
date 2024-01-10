class FirebaseUser {
  final String? name;
  final String email;
  final String password;

  FirebaseUser(this.name, this.email,this.password);

  FirebaseUser.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        email = json['email'] as String,
        password = json['password'] as String;

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password':password
  };
}