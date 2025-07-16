class CategoryModel {
  String? sId;
  String? name;
  String? slug;
  String? image;

  CategoryModel({this.sId, this.name, this.slug, this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    return data;
  }
}
