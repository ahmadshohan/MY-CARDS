class RegisterModel {
  String fullName = '';
  String email = '';
  String password = '';
  String passwordConfirm = '';
  String fullPhoneNumber = '';
  String phoneNumber = '';
  String countryCode = '';
  String role = 'زبون';
  int city = 1;
  dynamic avatar = '';

  RegisterModel();

  RegisterModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    passwordConfirm = json['password_confirmation'];
    fullName = json['name'];
    fullPhoneNumber = json['phone'];
    // avatar = json['avatar'];
    role = json['role'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['password_confirmation'] = this.passwordConfirm;
    data['name'] = this.fullName;
    data['phone'] = this.fullPhoneNumber;
    // data['avatar'] = this.avatar;
    data['city'] = this.city;
    data['role'] = this.role;
    return data;
  }
}
