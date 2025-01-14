import 'package:fruit_hub/core/entities/review_entity.dart';
import 'package:hive/hive.dart';
part 'product_entity.g.dart';

@HiveType(typeId: 1)
class ProductEntity {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String code;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final num price;
  @HiveField(4)
  String? imageUrl;
  @HiveField(5)
  final int expirationMonths;
  @HiveField(6)
  final bool isFeatured;
  @HiveField(7)
  final bool isOrganic;
  @HiveField(8)
  final int numberOfCalories;
  @HiveField(9)
  final num avgRating = 0;
  @HiveField(10)
  final num ratingCount = 0;
  @HiveField(11)
  final int unitAmount;
  @HiveField(12)
  final List<ReviewEntity> reviews;
  ProductEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    this.imageUrl,
    required this.isFeatured,
    this.isOrganic = false,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,
  });
}
