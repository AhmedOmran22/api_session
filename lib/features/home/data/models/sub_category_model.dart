class SubcategoryModel {
  String? sId;
  String? name;
  String? slug;
  String? category;

  SubcategoryModel({this.sId, this.name, this.slug, this.category});

  SubcategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['slug'] = slug;
    data['category'] = category;
    return data;
  }
}
