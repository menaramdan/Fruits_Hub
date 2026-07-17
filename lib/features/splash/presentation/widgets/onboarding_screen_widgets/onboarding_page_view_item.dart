import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_app/core/utils/app_images.dart';

class OnboardingPageViewItem extends StatelessWidget {
  const OnboardingPageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.title,
    required this.subtitle,
  });
  final String image;
  final String backgroundImage;
  final Widget title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(Assets.fruitBasketAmico1, width: 249),
              ),

              Padding(
                padding: EdgeInsetsGeometry.only(top: 60, right: 20),
                child: Text('تخط'),
              ),
            ],
          ),
        ),
        SizedBox(height: 60),
        title,
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37.1),
          child: Text(subtitle.toString(), textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
