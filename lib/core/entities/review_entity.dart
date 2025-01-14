import 'package:hive/hive.dart';

part 'review_entity.g.dart';

@HiveType(typeId: 2)
class ReviewEntity {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final num rating;
  @HiveField(3)
  final String date;
  @HiveField(4)
  final String reviewDescription;

  ReviewEntity({
    required this.name,
    required this.image,
    required this.rating,
    required this.date,
    required this.reviewDescription,
  });
}
