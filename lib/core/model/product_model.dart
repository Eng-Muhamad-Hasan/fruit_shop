
import 'package:fruit_shop/core/entity/product_entity.dart';
import 'package:fruit_shop/core/model/review_model.dart';

import '../functions/get_rating_avg.dart';

class ProductModel {
  final String name;
  final double price;
  final String code;
  final String description;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic = false;
  final num ratingAvg ;
  final int ratingCount = 0;
  final int numberOfCalories;
  final int caloriesAmountUnit;
  final int sellingCount;

  final List<ReviewModel> reviews;
  ProductModel({
    required this.name,
    required this.price,
    required this.code,
    required this.description,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.caloriesAmountUnit,
    this.sellingCount = 0,
    required this.reviews,
    required int ratingCount,
    required bool isOrganic,
    required this.ratingAvg,
  });

ProductEntity toEntity() => ProductEntity(
  name: name,
  price: price,
  code: code,
  description: description,
  isFeatured: isFeatured,
  imageUrl: imageUrl,
  expirationMonths: expirationMonths,
  isOrganic: isOrganic,
  ratingAvg: ratingAvg,
  ratingCount: ratingCount,
  numberOfCalories: numberOfCalories,
  caloriesAmountUnit: caloriesAmountUnit,
  sellingCount: sellingCount,
  reviews: reviews.map((e) => e.toEntity()).toList(),
);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'] as String,
      price: json['price'] as double,
      code: json['code'] as String,
      description: json['description'] as String,
      isFeatured: json['isFeatured'] as bool,
      imageUrl: json['imageUrl'] as String,
      expirationMonths: json['expirationMonths'] as int,
      isOrganic: json['isOrganic'] as bool,
      ratingCount: json['ratingCount'] as int,
      numberOfCalories: json['numberOfCalories'] as int,
      caloriesAmountUnit: json['caloriesAmountUnit'] as int,
      sellingCount: json['sellingCount'] as int,
      reviews:json['reviews'] !=null? List<ReviewModel>.from(
        json['reviews'].map((x) => ReviewModel.fromJson(x)),
      ):[],
      ratingAvg: getRatingAvg(json['reviews'] !=null?
        List<ReviewModel>.from(
          json['reviews'].map(( x) => ReviewModel.fromJson(x)),
     ):[])
    );
  }

  toJson() {
    return {
      'name': name,
      'price': price,
      'code': code,
      'description': description,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationMonths': expirationMonths,
      'isOrganic': isOrganic,
      'ratingAvg': ratingAvg,
      'ratingCount': ratingCount,
      'numberOfCalories': numberOfCalories,
      'caloriesAmountUnit': caloriesAmountUnit,
      'sellingCount': sellingCount,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}


