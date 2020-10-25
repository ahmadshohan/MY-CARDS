class HomePageProductsResult {
  String status;
  int errors;
  List<Category> data;

  HomePageProductsResult({this.status, this.errors, this.data});

  HomePageProductsResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errors = json['errors'];
    if (json['data'] != null) {
      data = new List<Category>();
      json['data'].forEach((v) {
        data.add(new Category.fromJson(v));
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

class Category {
  int id;
  String name;
  String avatar;
  int featured;
  int userId;
  String createdAt;
  String updatedAt;
  List<ProductModel> productsHomePage;

  Category(
      {this.id,
      this.name,
      this.avatar,
      this.featured,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.productsHomePage});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    featured = json['featured'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['products_home_page'] != null) {
      productsHomePage = new List<ProductModel>();
      json['products_home_page'].forEach((v) {
        productsHomePage.add(new ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['featured'] = this.featured;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.productsHomePage != null) {
      data['products_home_page'] =
          this.productsHomePage.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductModel {
  int id;
  String name;
  Null gallery;
  String price;
  String points;
  String qun;
  String avatar;
  String summary;
  int userId;
  int categoryId;
  String createdAt;
  String updatedAt;
  String relatedProducts;

  ProductModel(
      {this.id,
      this.name,
      this.gallery,
      this.price,
      this.points,
      this.qun,
      this.avatar,
      this.summary,
      this.userId,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.relatedProducts});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gallery = json['gallery'];
    price = json['price'];
    points = json['points'];
    qun = json['qun'];
    avatar = json['avatar'];
    summary = json['summary'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    relatedProducts = json['related_products'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['gallery'] = this.gallery;
    data['price'] = this.price;
    data['points'] = this.points;
    data['qun'] = this.qun;
    data['avatar'] = this.avatar;
    data['summary'] = this.summary;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['related_products'] = this.relatedProducts;
    return data;
  }
}
