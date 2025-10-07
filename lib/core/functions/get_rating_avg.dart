import 'package:fruit_shop/core/model/review_model.dart';

num getRatingAvg(List<ReviewModel> reviews) {
  num sum = 0;
  if (reviews.isNotEmpty) {
    for (var i = 0; i < reviews.length; i++) {
      sum += reviews[i].rating;
    }
    return sum / reviews.length;
  } else {
    return 1;
  }
}
