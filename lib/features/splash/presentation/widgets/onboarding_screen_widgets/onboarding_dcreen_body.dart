import 'package:flutter/material.dart';
import 'package:new_app/features/splash/presentation/widgets/onboarding_screen_widgets/onboarding_page_view.dart';

class OnboardingDcreenBody extends StatelessWidget {
  const OnboardingDcreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        OnboardingPageView()
      ],
    );
  }
}