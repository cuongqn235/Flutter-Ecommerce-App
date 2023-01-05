class User {
  String? email = '';
  String? accessToken = '';
  String? role = '';

  User({
    this.email,
    this.accessToken,
    this.role,
  });

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    accessToken = json['accessToken'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['accessToken'] = accessToken;
    data['role'] = role;
    return data;
  }
}
