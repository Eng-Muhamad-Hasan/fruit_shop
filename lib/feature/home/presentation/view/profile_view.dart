import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/Feature/home/presentation/cubit/profile-cubit/change_language_cubit.dart';
import 'package:fruit_shop/core/constants/constants.dart';
import 'package:fruit_shop/core/functions/show_language_dialog.dart';
import 'package:fruit_shop/core/shared/custom_appbar_widget.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';
import 'package:fruit_shop/generated/l10n.dart';

import '../../../../core/utils/app_assets.dart';
import '../widget/profile_widget/log_out_button.dart';
import '../widget/profile_widget/profile_header.dart';
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
              buildAppBar(
                context,
                title: S.of(context).profile_title,
                backButton: false,
              ),
              const SizedBox(height: 16),
              const ProfileHeader(),
              const SizedBox(height: 16),
              Text(
                S.of(context).profile_header_section,
                style: AppTextStyles.bodySemiBold13.copyWith(
                  color: AppColors.gray950,
                ),
              ),
              const SizedBox(height: 16),
              ProfileItem(
                title: S.of(context).profile_personal_file,
                svgIcon: Assets.imagesPersonalIcon,
              ),
              const Divider(height: 10, color: Color(0xFFD8D8D8)),
              ProfileItem(
                title: S.of(context).profile_my_orders,
                svgIcon: Assets.imagesMyOrders,
              ),
              const Divider(height: 10, color: Color(0xFFD8D8D8)),
              ProfileItem(
                title: S.of(context).profile_my_payments,
                svgIcon: Assets.imagesPayments,
              ),
              const Divider(height: 10, color: Color(0xFFD8D8D8)),
              ProfileItem(
                title: S.of(context).profile_my_favorites,
                svgIcon: Assets.imagesFavoriteList,
              ),
              const Divider(height: 10, color: Color(0xFFD8D8D8)),
              ProfileItem(
                title: S.of(context).profile_my_notifications,
                svgIcon: Assets.imagesNotificationOption,
                isSwitch: true,
              ),
              const Divider(height: 10, color: Color(0xFFD8D8D8)),
              ProfileItem(
                title: S.of(context).profile_language,
                svgIcon: Assets.imagesLangOption,
                isText: true,
                onTap: () async {
                  String? selectedLanguage = await showLanguageDialog(context);
                  if (selectedLanguage != null && context.mounted) {
                    // ignore: use_build_context_synchronously
                    context.read<ChangeLanguageCubit>().toggleLanguage(
                      Locale(selectedLanguage),
                    );
                  }
                },
              ),
              const Divider(height: 10, color: Color(0xFFD8D8D8)),
              ProfileItem(
                title: S.of(context).profile_theme,
                svgIcon: Assets.imagesThemeOption,
                isSwitch: true,
              ),
              const Divider(height: 10, color: Color(0xFFD8D8D8)),
              const SizedBox(height: 16),
              Text(
                S.of(context).profile_help,
                style: AppTextStyles.bodySemiBold13.copyWith(
                  color: AppColors.gray950,
                ),
              ),
              const SizedBox(height: 8),
              ProfileItem(
                title: S.of(context).profile_about_us,
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
