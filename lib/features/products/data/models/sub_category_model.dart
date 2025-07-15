
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['category'] = this.category;
    return data;
  }
}
