import 'package:flutter/material.dart';
import 'package:new_app/features/splash/presentation/widgets/onboarding_screen_widgets/onboarding_screen_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: OnboardingDcreenBody());
  }
}
