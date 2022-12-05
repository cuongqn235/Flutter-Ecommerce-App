class ResultProfile {
  int errorCode = -1;
  String message = '';
  int timeStamp = -1;
  Profile data = Profile();
  ResultProfile();
  ResultProfile.add(this.errorCode, this.message, this.timeStamp, this.data);

  ResultProfile.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    message = json['message'];
    timeStamp = json['timeStamp'];
    data = json['data'] != null ? Profile.fromJson(json['data']) : Profile();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorCode'] = this.errorCode;
    data['message'] = this.message;
    data['timeStamp'] = this.timeStamp;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Profile {
  int id = -1;
  String email = '';
  String firstName = '';
  String lastName = '';
  String image = '';
  String gender = '';
  String birthday = '';
  String createdDate = '';
  Profile();
  Profile.add(this.id, this.email, this.firstName, this.lastName, this.image,
      this.gender, this.birthday, this.createdDate);

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? -1;
    email = json['email'] ?? '';
    firstName = json['firstName'] ?? '';
    lastName = json['lastName'] ?? '';
    image = json['image'] ?? '';
    gender = json['gender'] ?? '';
    birthday = json['birthday'] ?? '';
    createdDate = json['createdDate'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['image'] = this.image;
    data['gender'] = this.gender;
    data['birthday'] = this.birthday;
    data['createdDate'] = this.createdDate;
    return data;
  }
}
