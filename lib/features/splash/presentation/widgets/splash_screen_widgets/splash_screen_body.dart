import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:new_app/core/routes/app_routes.dart';
import 'package:new_app/core/services/shared_prefrence_singletone.dart';
import 'package:new_app/core/utils/app_images.dart';
import 'package:new_app/core/utils/constants.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  bool _startAnimation = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          _startAnimation = true;
        });
      }
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        bool onbaordingseen = SharedPrefrenceSingletone.getBool(onboardingKey);
        if (onbaordingseen) {
          Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
        } else {
          Navigator.pushReplacementNamed(context, AppRoutes.onboardingScreen);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    const animationDuration = Duration(milliseconds: 900);
    const animationCurve = Curves.easeOutBack;

    return Stack(
      children: [
        AnimatedPositioned(
          duration: animationDuration,
          curve: animationCurve,
          top: _startAnimation ? 0.0 : -190.0,
          left: _startAnimation ? 0.0 : -190.0,
          child: SvgPicture.asset(
            Assets.plantoftree, // ورقة الشجر الصح
            fit: BoxFit.contain,
            width: 190,
            height: 172,
          ),
        ),

        Center(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeIn,
            opacity: _startAnimation ? 1.0 : 0.0, // من مخفي لـ ظاهر
            child: AnimatedContainer(
              duration: animationDuration,
              curve: animationCurve,
              width: _startAnimation ? 250.0 : 100.0,
              height: _startAnimation ? 250.0 : 100.0,
              child: Lottie.asset(
                'assets/animations/Fruit Basket.json',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),

        AnimatedPositioned(
          duration: animationDuration,
          curve: animationCurve,
          bottom: _startAnimation ? 0.0 : -150.0,
          left: 0.0,
          right: 0.0,
          child: SvgPicture.asset(
            Assets.bubles,
            width: screenWidth,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
