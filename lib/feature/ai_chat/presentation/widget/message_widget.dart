import 'package:flutter/material.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';
import 'package:fruit_shop/core/utils/app_text_styles.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.message,
    required this.isFromUser,
  });
  final String message;
  final bool isFromUser;
  @override
  Widget build(BuildContext context) {
    // Chat bubble with asymmetric corners, gradient, small avatar and max width
    final bubble = ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 520),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          gradient: isFromUser
              ? const LinearGradient(
                  colors: [
                    AppColors.primaryColor,
                    AppColors.lighterPrimaryColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : const LinearGradient(
                  colors: [AppColors.orange400, AppColors.orange500],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isFromUser ? 16 : 4),
            topRight: Radius.circular(isFromUser ? 4 : 16),
            bottomLeft: const Radius.circular(16),
            bottomRight: const Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.06 * 255).round()),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          message,
          style: AppTextStyles.bodySemiBold13.copyWith(color: Colors.white),
        ),
      ),
    );

    // small circular avatar placeholder
    final avatar = Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: isFromUser
              ? [AppColors.lighterPrimaryColor, AppColors.primaryColor]
              : [AppColors.orange300, AppColors.orange500],
        ),
      ),
      child: Center(
        child: Text(
          isFromUser ? 'U' : 'AI',
          style: AppTextStyles.bodyBaseRegular16.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: Row(
        mainAxisAlignment: isFromUser
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: isFromUser
            ? [
                const Flexible(child: SizedBox.shrink()),
                avatar,
                const SizedBox(width: 8),

                Flexible(child: bubble),
              ]
            : [Flexible(child: bubble), const SizedBox(width: 8), avatar],
      ),
    );
  }
}
