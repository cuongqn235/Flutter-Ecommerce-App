class Profile {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? image;
  String? gender;
  String? birthday;
  String? createdDate;
  Profile(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.image,
      this.gender,
      this.birthday,
      this.createdDate});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    image = json['image'];
    gender = json['gender'];
    birthday = json['birthday'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['image'] = image;
    data['gender'] = gender;
    data['birthday'] = birthday;
    data['createdDate'] = createdDate;
    return data;
  }
}
