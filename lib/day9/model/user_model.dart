class UserModel {
  final String name;
  final String emailid;
  final String username;
  final String city;
  final String mobileno;

  UserModel({
    required this.name,
    required this.emailid,
    required this.username,
    required this.city,
    required this.mobileno,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
     // emailid: json['emailid'],
      //username: json['username'],
      //city: json['city'],
      mobileno: json['mobileno'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "emailid": emailid,
      "username": username,
      "city": city,
      "mobileno": mobileno,

    };
  }
}
