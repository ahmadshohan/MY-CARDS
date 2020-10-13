class RegisterModel {
  String fullName = '';
  String email = '';
  String password = '';
  String passwordConfirm = '';
  String genderType = '';
  String phoneNumber = '';
  dynamic avatar = '';

  RegisterModel();

  RegisterModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    passwordConfirm = json['passwordConfirm'];
    fullName = json['name'];
    genderType = json['gender'];
    phoneNumber = json['phone'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['passwordConfirm'] = this.passwordConfirm;
    data['name'] = this.fullName;
    data['gender'] = this.genderType;
    data['phone'] = this.phoneNumber;
    data['avatar'] = this.avatar;
    return data;
  }
}
