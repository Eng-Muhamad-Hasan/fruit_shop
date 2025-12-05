import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_shop/core/utils/app_assets.dart';

class CustomPreview extends StatelessWidget {
  @Preview(name: 'Custom Button', group: 'Buttons')

  const CustomPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(spacing: 12,
      children: [

        Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .1),
                blurRadius: 16,
                spreadRadius: 0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Center(
            child: Text('preview',style: TextStyle(fontSize: 20,color: Colors.tealAccent),),
          ),
        ),
        SvgPicture.asset(Assets.imagesPageViewItem2Image)
      ],
    );
  }
}