
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:new_app/core/utils/app_images.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Positioned(
          top: 0.0,
          left: 0.0,
          child: SvgPicture.asset(Assets.imageplant,fit: BoxFit.contain,)),
        Center(
          child: Lottie.asset('assets/animations/Fruit Basket.json' ,width: 250 , height: 250 )
        ),

        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: SvgPicture.asset(Assets.imageplant63))
      ],
    );
  }
}