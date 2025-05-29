import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/functions/get_average_rating.dart';
import 'package:fruit_hub/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  final bool isOrganic;
  String? imageUrl;
  final int expirationMonths;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating;
  final num ratingCount = 0;
  final List<ReviewModel> reviews;
  final num? sellingCount;
  ProductModel(
      {required this.name,
      required this.code,
      required this.description,
      required this.expirationMonths,
      required this.numberOfCalories,
      required this.avgRating,
      required this.unitAmount,
      this.sellingCount = 20,
      required this.reviews,
      required this.price,
      required this.isOrganic,
      required this.isFeatured,
      this.imageUrl});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      avgRating: getAverageRating(json['reviews'] != null
          ? List<ReviewModel>.from(
              json['reviews'].map((e) => ReviewModel.fromJson(e)))
          : []),
      name: json['name'],
      code: json['code'],
      description: json['description'],
      expirationMonths: json['expirationMonths'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      sellingCount: json['sellingCount'],
      reviews: json['reviews'] != null
          ? List<ReviewModel>.from(
              json['reviews'].map((e) => ReviewModel.fromJson(e)))
          : [],
      price: json['price'],
      isOrganic: json['isOrganic'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
        name: name,
        code: code,
        description: description,
        price: price,
        reviews: reviews.map((e) => e.toEntity()).toList(),
        expirationMonths: expirationMonths,
        numberOfCalories: numberOfCalories,
        unitAmount: unitAmount,
        isOrganic: isOrganic,
        isFeatured: isFeatured,
        imageUrl: imageUrl);
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationMonths': expirationMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList()
    };
  }
}
