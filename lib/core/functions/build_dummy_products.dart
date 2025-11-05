import '../entity/product_entity.dart';

ProductEntity buildDummyProducts() {
  final product = ProductEntity(
    name: 'Apple',
    imageUrl: null,
    price: 10,
    description: 'التفاحة النباتية',
    code: 'ddffgg',
    isFeatured: false,
    caloriesAmountUnit: 120,
    expirationMonths: 2,
    numberOfCalories: 22,
    reviews: const [],
    isOrganic: false,
    ratingAvg: 22,
    ratingCount: 12,sellingCount: 0
  );
  return product;
}

List<ProductEntity> getDummyProducts() {
  return [
    buildDummyProducts(),
    buildDummyProducts(),
    buildDummyProducts(),
    buildDummyProducts(),
  ];
}
