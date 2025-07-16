class CartProductModel {
  String? status;
  num? numOfCartItems;
  String? cartId;
  Data? data;

  CartProductModel({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  CartProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? sId;
  String? cartOwner;
  List<CartProducts>? products;
  String? createdAt;
  String? updatedAt;
  num? iV;
  num? totalCartPrice;

  Data({
    this.sId,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.totalCartPrice,
  });

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = <CartProducts>[];
      json['products'].forEach((v) {
        products!.add(CartProducts.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class CartProducts {
  num? count;
  String? sId;
  Product? product;
  num? price;

  CartProducts({this.count, this.sId, this.product, this.price});

  CartProducts.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    sId = json['_id'];
    product = json['product'] != null
        ? Product.fromJson(json['product'])
        : null;
    price = json['price'];
  }
}

class Product {
  List<Subcategory>? subcategory;
  String? sId;
  String? title;
  num? quantity;
  String? imageCover;
  Category? category;
  Category? brand;
  num? ratingsAverage;
  String? id;

  Product({
    this.subcategory,
    this.sId,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.id,
  });

  Product.fromJson(Map<String, dynamic> json) {
    if (json['subcategory'] != null) {
      subcategory = <Subcategory>[];
      json['subcategory'].forEach((v) {
        subcategory!.add(Subcategory.fromJson(v));
      });
    }
    sId = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    brand = json['brand'] != null
        ? Category.fromJson(json['brand'])
        : null;
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }
}

class Subcategory {
  String? sId;
  String? name;
  String? slug;
  String? category;

  Subcategory({this.sId, this.name, this.slug, this.category});

  Subcategory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}

class Category {
  String? sId;
  String? name;
  String? slug;
  String? image;

  Category({this.sId, this.name, this.slug, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}
