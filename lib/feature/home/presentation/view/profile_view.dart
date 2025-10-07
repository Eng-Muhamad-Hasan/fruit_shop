import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_shop/core/constants/constants.dart';
import 'package:fruit_shop/core/shared/custom_appbar_widget.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';

import '../../../../core/utils/app_assets.dart';
import '../widget/profile_widget/log_out_button.dart';
import '../widget/profile_widget/profile_item.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizentalPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildAppBar(context, title: 'حسابي', backButton: false),
              const SizedBox(height: 16),
              ListTile(
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
              ),
              const SizedBox(height: 16),
              Text(
                'عام',
                style: AppTextStyles.bodySemiBold13.copyWith(
                  color: AppColors.gray950,
                ),
              ),
              const SizedBox(height: 16),
              const ProfileItem(
                title: 'الملف الشخصي',
                svgIcon: Assets.imagesPersonalIcon,
              ),
              const Divider(height: 10, color: Color(0xFFD8D8D8)),
              const ProfileItem(
                title: 'طلباتي',
                svgIcon: Assets.imagesMyOrders,
              ),
              const Divider(height: 10, color: Color(0xFFD8D8D8)),
              const ProfileItem(
                title: 'المدفوعات',
                svgIcon: Assets.imagesPayments,
              ),
              const Divider(height: 10, color: Color(0xFFD8D8D8)),
              const ProfileItem(
                title: 'المفضلة',
                svgIcon: Assets.imagesFavoriteList,
              ),
              const Divider(height: 10, color: Color(0xFFD8D8D8)),
              const ProfileItem(
                title: 'الإشعارات',
                svgIcon: Assets.imagesNotificationOption,
                isSwitch: true,
              ),
              const Divider(height: 10, color: Color(0xFFD8D8D8)),
              const ProfileItem(
                title: 'اللغة',
                svgIcon: Assets.imagesLangOption,
                isText: true,
              ),
              const Divider(height: 10, color: Color(0xFFD8D8D8)),
              const ProfileItem(
                title: 'المظهر',
                svgIcon: Assets.imagesThemeOption,
                isSwitch: true,
              ),
              const Divider(height: 10, color: Color(0xFFD8D8D8)),
              const SizedBox(height: 16),
              Text(
                'المساعدة',
                style: AppTextStyles.bodySemiBold13.copyWith(
                  color: AppColors.gray950,
                ),
              ),
              const SizedBox(height: 8),
              const ProfileItem(
                title: 'من نحن ؟',
                svgIcon: Assets.imagesAboutUs,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const LogOutButton(),
        const SizedBox(height: 16),
      ],
    );
  }
}
