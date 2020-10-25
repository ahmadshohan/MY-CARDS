class User {
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

  User(
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
      this.active});

  User.fromJson(Map<String, dynamic> json) {
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
