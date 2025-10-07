
import '../entity/review_entity.dart';

class ReviewModel {
  final String userName;
  final String image;
  final String reviewComment;
  final num rating;
  final String date;

  ReviewModel({
    required this.userName,
    required this.image,
    required this.reviewComment,
    required this.rating,
    required this.date,
  });



  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      userName: entity.userName,
      image: entity.image,
      reviewComment: entity.reviewComment,
      rating: entity.rating,
      date: entity.date,
    );
  }
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      userName: json['userName'] as String,
      image: json['image'] as String,
      reviewComment: json['reviewComment'] as String,
      rating: json['rating'] as num,
      date: json['date'] as String,
    );
  }
ReviewEntity toEntity() => ReviewEntity(
  userName: userName,
  image: image,
  reviewComment: reviewComment,
  rating: rating,
  date: date,
);

  toJson() {
    return {
      'userName': userName,
      'image': image,
      'reviewComment': reviewComment,
      'rating': rating,
      'date': date,
    };
  }
}
