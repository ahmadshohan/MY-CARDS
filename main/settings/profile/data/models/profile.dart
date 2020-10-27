import 'package:mycarts/account/data/models/city.dart';

class ProfileResult {
  String status;
  int errors;
  Profile data;

  ProfileResult({this.status, this.errors, this.data});

  ProfileResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errors = json['errors'];
    data = json['data'] != null ? new Profile.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errors'] = this.errors;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Profile {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  int role;
  String avatar;
  int balance;
  String createdAt;
  String updatedAt;
  dynamic minOrder;
  dynamic commission;
  int active;
  City city;
  dynamic phone;

  Profile(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.role,
      this.avatar,
      this.balance,
      this.createdAt,
      this.updatedAt,
      this.minOrder,
      this.commission,
      this.active,
      this.city,
      this.phone});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    role = json['role'];
    avatar = json['avatar'];
    balance = json['balance'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    minOrder = json['min_order'];
    commission = json['commission'];
    active = json['active'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['role'] = this.role;
    data['avatar'] = this.avatar;
    data['balance'] = this.balance;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['min_order'] = this.minOrder;
    data['commission'] = this.commission;
    data['active'] = this.active;
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    data['phone'] = this.phone;
    return data;
  }
}
