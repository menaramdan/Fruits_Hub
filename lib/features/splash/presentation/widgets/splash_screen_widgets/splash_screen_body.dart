import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:new_app/core/utils/app_images.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
          top: 0.0,
          left: 0.0,
          child: SvgPicture.asset(
            Assets.imageplant63,
            fit: BoxFit.contain,
            width: 190,
            height: 172,
          ),
        ),
        Center(
          child: Lottie.asset(
            'assets/animations/Fruit Basket.json',
            width: 250,
            height: 250,
          ),
        ),

        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: SvgPicture.asset(Assets.imageplant, width: screenWidth),
        ),
      ],
    );
  }
}
