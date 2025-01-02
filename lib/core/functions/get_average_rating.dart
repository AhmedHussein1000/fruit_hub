
import 'package:fruit_hub/core/models/review_model.dart';

num getAverageRating(List<ReviewModel> reviews) {
  if (reviews.isEmpty) {
    return 0;
  }
  double totalRating = 0;
  for (var review in reviews) {
    totalRating += review.rating;
  }
  return totalRating / reviews.length;
}