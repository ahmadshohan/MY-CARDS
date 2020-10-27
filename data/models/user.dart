import 'package:mycarts/account/data/models/city.dart';

class User {
  String name;
  String email;
  int role;
  String phone;
  City city;
  dynamic minOrder;
  dynamic commission;
  int balance;
  int active;
  String updatedAt;
  String createdAt;
  int id;

  User(
      {this.name,
      this.email,
      this.role,
      this.phone,
      this.minOrder,
      this.commission,
      this.balance,
      this.active,
      this.city,
      this.updatedAt,
      this.createdAt,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
    phone = json['phone'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    minOrder = json['min_order'];
    commission = json['commission'];
    balance = json['balance'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    data['phone'] = this.phone;
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['min_order'] = this.minOrder;
    data['commission'] = this.commission;
    data['balance'] = this.balance;
    data['active'] = this.active;
    return data;
  }
}

class Response {
  String token;
  Response({this.token});
  Response.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}
