import 'package:fruit_hub/core/entities/product_entity.dart';

abstract class GetDummyData {
 static ProductEntity getDummyProduct() {
    return ProductEntity(
      name: 'Banana',
      code: '10',
      description: 'Fresh and juicy banana',
      price: 25,
      reviews: [],
      expirationMonths: 2,
      numberOfCalories: 80,
      unitAmount: 100,
      isOrganic: true,
      isFeatured: true,
      imageUrl: null,
    );
  }

 static List<ProductEntity> getDummyProducts() {
    return List.filled(6, getDummyProduct());
  }
}
