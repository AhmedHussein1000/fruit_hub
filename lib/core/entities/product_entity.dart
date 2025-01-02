
import 'package:fruit_hub/core/entities/review_entity.dart';

class ProductEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  String? imageUrl;
  final int expirationMonths;
  final bool isFeatured;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final List<ReviewEntity> reviews;
  ProductEntity( {
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    this.imageUrl,
    required this.isFeatured,
    this.isOrganic = false,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount
    ,required this.reviews,
  });
}
