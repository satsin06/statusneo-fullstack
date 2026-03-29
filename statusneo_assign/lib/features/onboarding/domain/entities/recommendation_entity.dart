import 'product_entity.dart';

class RecommendationEntity {
  final String planName;
  final int dailyKcal;
  final int dailyPortionGrams;
  final List<String> proteins;
  final List<ProductEntity> products;

  const RecommendationEntity({
    required this.planName,
    required this.dailyKcal,
    required this.dailyPortionGrams,
    required this.proteins,
    required this.products,
  });
}