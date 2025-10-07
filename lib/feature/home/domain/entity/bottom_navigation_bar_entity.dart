import 'package:fruit_shop/core/utils/app_assets.dart';

class BottomNavigationBarEntity {
  final String name;
  final String activeImage, inActiveImage;
  const BottomNavigationBarEntity({
    required this.name,
    required this.activeImage,
    required this.inActiveImage,
  });
}

List<BottomNavigationBarEntity> get getBottomNavigationBarEntityList {
  return [
    const BottomNavigationBarEntity(
      name: 'الرئيسية',
      activeImage: Assets.imagesHomeFill,
      inActiveImage: Assets.imagesHomeOut,
    ),
    const BottomNavigationBarEntity(
      name: 'المنتجات',
      activeImage: Assets.imagesProductsFill,
      inActiveImage: Assets.imagesProductsOut,
    ),
    const BottomNavigationBarEntity(
      name: 'سلة التسوق',
      activeImage: Assets.imagesCartFill,
      inActiveImage: Assets.imagesCartOut,
    ),
    const BottomNavigationBarEntity(
      name: 'حسابي',
      activeImage: Assets.imagesUserFill,
      inActiveImage: Assets.imagesUserOut,
    ),
  ];
}
