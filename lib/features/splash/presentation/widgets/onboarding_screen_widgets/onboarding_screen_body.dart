import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:new_app/core/routes/app_routes.dart';
import 'package:new_app/core/services/shared_prefrence_singletone.dart';
import 'package:new_app/core/utils/app_colors.dart';
import 'package:new_app/core/utils/constants.dart';
import 'package:new_app/core/widgets/custom_button.dart';
import 'package:new_app/features/splash/presentation/widgets/onboarding_screen_widgets/onboarding_page_view.dart';

class OnboardingDcreenBody extends StatefulWidget {
  const OnboardingDcreenBody({super.key});

  @override
  State<OnboardingDcreenBody> createState() => _OnboardingDcreenBodyState();
}

class _OnboardingDcreenBodyState extends State<OnboardingDcreenBody> {
  late PageController pageController;
  var currentpage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentpage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OnboardingPageView(pageController: pageController),
        Padding(
          padding: const EdgeInsets.only(bottom: 74),
          child: DotsIndicator(
            dotsCount: 2,
            decorator: DotsDecorator(
              activeColor: AppColors.greencolor,
              color: currentpage == 1
                  ? AppColors.greencolor
                  : AppColors.greencolor1,
              size: Size.square(9.0),
              activeSize: Size.square(11.0),
            ),
          ),
        ),
        Visibility(
          visible: currentpage == 1 ? true : false,
          maintainAnimation: true,
          maintainState: true,
          maintainSize: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(
              text: 'ابدأ الان',
              onPressed: () {
                SharedPrefrenceSingletone.setBool(onboardingKey, true);
                Navigator.of(
                  context,
                ).pushReplacementNamed(AppRoutes.loginScreen);
              },
            ),
          ),
        ),
        SizedBox(height: 43),
      ],
    );
  }
}
