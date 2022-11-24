class User {
  String email = '';
  String accessToken = '';
  String role = '';

  User();

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    accessToken = json['accessToken'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['accessToken'] = this.accessToken;
    data['role'] = this.role;
    return data;
  }
}
