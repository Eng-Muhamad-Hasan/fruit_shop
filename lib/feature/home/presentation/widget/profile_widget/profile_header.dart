import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 73,
            height: 73,
            decoration: const ShapeDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  "https://www.bing.com/th?id=OSB.UdgSa%7C9np6TDQZ8JFqen3A--.png&pid=MSports&w=72&h=72&qlt=90&c=0&rs=1&dpr=1&p=1",
                ),
                fit: BoxFit.contain,
              ),
              shape: CircleBorder(),
            ),
          ),
          Positioned(
            bottom: -16,
            right: 0,
            left: 0,
            child: Container(
              height: 32,
              width: 32,
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffF9F9F9),
              ),
              child: SvgPicture.asset(Assets.imagesCamera),
            ),
          ),
        ],
      ),
      title: Text(
        'محمد حسن',
        style: AppTextStyles.bodyXSmallBold13.copyWith(
          color: const Color(0xFF131F46),
        ),
      ),
      subtitle: Text(
        'mhmd-hsn@Gmail.com',
        style: AppTextStyles.bodySmallRegular13.copyWith(
          color: const Color(0xFF888FA0),
        ),
      ),
    );
  }
}
