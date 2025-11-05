
import 'package:equatable/equatable.dart';
import 'package:fruit_shop/core/entity/review_entity.dart';


// ignore: must_be_immutable
class ProductEntity extends Equatable {
  final String name;
  final double price;
  final String code;
  final String description;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final num ratingAvg;
  final int ratingCount;
  final int sellingCount;
  final int numberOfCalories;
  final int caloriesAmountUnit;
  final List<ReviewEntity> reviews;
  ProductEntity({
    required this.name,
    required this.price,
    required this.code,
    required this.description,
    required this.isFeatured,
    this.imageUrl,
    this.isOrganic = false,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.caloriesAmountUnit,
    this.ratingAvg = 0,
    this.ratingCount = 0,
   required this.sellingCount ,
    required this.reviews,
  });
  
  @override
  List<Object?> get props => [code];
}
