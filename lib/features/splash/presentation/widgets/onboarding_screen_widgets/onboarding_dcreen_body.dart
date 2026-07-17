import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/features/splash/presentation/widgets/onboarding_screen_widgets/onboarding_page_view.dart';

class OnboardingDcreenBody extends StatelessWidget {
  const OnboardingDcreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OnboardingPageView(),
        Padding(
          padding: const EdgeInsets.only(bottom: 64),
          child: DotsIndicator(
            dotsCount: 2,
            decorator: DotsDecorator(
              activeColor: AppColors.greencolor,
              color: AppColors.greencolor1,
              size: Size.square(9.0),
              activeSize: Size.square(11.0),
            ),
          ),
        ),
      ],
    );
  }
}
