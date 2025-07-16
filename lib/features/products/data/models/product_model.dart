import 'category_model.dart';
import 'sub_category_model.dart';

class ProductModel {
  num? sold;
  List<String>? images;
  List<SubcategoryModel>? subcategory;
  num? ratingsQuantity;
  String? sId;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryModel? category;
  CategoryModel? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  String? id;

  ProductModel({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.sId,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    sold = json['sold'];
    images = json['images'].cast<String>();
    if (json['subcategory'] != null) {
      subcategory = <SubcategoryModel>[];
      json['subcategory'].forEach((v) {
        subcategory!.add(SubcategoryModel.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
    brand = json['brand'] != null
        ? CategoryModel.fromJson(json['brand'])
        : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }
}
