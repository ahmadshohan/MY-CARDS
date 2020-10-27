class CityResult {
  String status;
  int errors;
  List<City> data;

  CityResult({this.status, this.errors, this.data});

  CityResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errors = json['errors'];
    if (json['data'] != null) {
      data = new List<City>();
      json['data'].forEach((v) {
        data.add(new City.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errors'] = this.errors;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  int id;
  String name;
  int userId;
  String createdAt;
  String updatedAt;

  City({this.id, this.name, this.userId, this.createdAt, this.updatedAt});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
