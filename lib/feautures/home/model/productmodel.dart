import 'dart:convert';

class ProductResponse {
  List<Product> products;
  int total;
  int skip;
  int limit;

  ProductResponse({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductResponse.fromJson(String str) => 
    ProductResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductResponse.fromMap(Map<String, dynamic> json) => ProductResponse(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromMap(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toMap() => {
        "products": List<dynamic>.from(products.map((x) => x.toMap())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class Product {
  int id;
  String title;
  String description;
  String category;
  double price;
  double discountPercentage;
  double rating;
  int stock;
  List<String> tags;
  String brand;
  String sku;
  double weight;
  Dimensions dimensions;
  String warrantyInformation;
  String shippingInformation;
  String availabilityStatus;
  List<Review> reviews;
  String returnPolicy;
  int minimumOrderQuantity;
  Meta meta;
  List<String> images;
  String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        price: json["price"].toDouble(),
        discountPercentage: json["discountPercentage"].toDouble(),
        rating: json["rating"].toDouble(),
        stock: json["stock"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        brand: json["brand"],
        sku: json["sku"],
        weight: json["weight"].toDouble(),
        dimensions: Dimensions.fromMap(json["dimensions"]),
        warrantyInformation: json["warrantyInformation"],
        shippingInformation: json["shippingInformation"],
        availabilityStatus: json["availabilityStatus"],
        reviews: List<Review>.from(
            json["reviews"].map((x) => Review.fromMap(x))),
        returnPolicy: json["returnPolicy"],
        minimumOrderQuantity: json["minimumOrderQuantity"],
        meta: Meta.fromMap(json["meta"]),
        images: List<String>.from(json["images"].map((x) => x)),
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "category": category,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "brand": brand,
        "sku": sku,
        "weight": weight,
        "dimensions": dimensions.toMap(),
        "warrantyInformation": warrantyInformation,
        "shippingInformation": shippingInformation,
        "availabilityStatus": availabilityStatus,
        "reviews": List<dynamic>.from(reviews.map((x) => x.toMap())),
        "returnPolicy": returnPolicy,
        "minimumOrderQuantity": minimumOrderQuantity,
        "meta": meta.toMap(),
        "images": List<dynamic>.from(images.map((x) => x)),
        "thumbnail": thumbnail,
      };
}

class Dimensions {
  double width;
  double height;
  double depth;

  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory Dimensions.fromJson(String str) =>
      Dimensions.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dimensions.fromMap(Map<String, dynamic> json) => Dimensions(
        width: json["width"].toDouble(),
        height: json["height"].toDouble(),
        depth: json["depth"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "width": width,
        "height": height,
        "depth": depth,
      };
}

class Review {
  int rating;
  String comment;
  DateTime date;
  String reviewerName;
  String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Review.fromJson(String str) => Review.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Review.fromMap(Map<String, dynamic> json) => Review(
        rating: json["rating"],
        comment: json["comment"],
        date: DateTime.parse(json["date"]),
        reviewerName: json["reviewerName"],
        reviewerEmail: json["reviewerEmail"],
      );

  Map<String, dynamic> toMap() => {
        "rating": rating,
        "comment": comment,
        "date": date.toIso8601String(),
        "reviewerName": reviewerName,
        "reviewerEmail": reviewerEmail,
      };
}

class Meta {
  DateTime createdAt;
  DateTime updatedAt;
  String barcode;
  String qrCode;

  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        barcode: json["barcode"],
        qrCode: json["qrCode"],
      );

  Map<String, dynamic> toMap() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "barcode": barcode,
        "qrCode": qrCode,
      };
}
