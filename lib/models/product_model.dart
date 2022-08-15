class ProductModel{
  int? id;
  String? title;
  String? description;
  String? category;
  String? image;

  ProductModel({this.id, this.title,this.description,this.category,this.image});

  factory ProductModel.fromJson(Map<String,dynamic> json)=>ProductModel(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    category: json['category'],
    image: json['image'],
  );
}

class Rating{
  double? rate;
  int?count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String,dynamic> json)=>Rating(
    rate: json['rate'],
    count: json['count']
  );
}