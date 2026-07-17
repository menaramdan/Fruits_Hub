import 'package:flutter/material.dart';
import 'package:new_app/core/utils/app_images.dart';
import 'package:new_app/features/splash/presentation/widgets/onboarding_screen_widgets/onboarding_page_view_item.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        children: [
          OnboardingPageViewItem(
            image: Assets.fruitBasketAmico1,
            backgroundImage: Assets.backgroundImage,
            title: Row(children: [
              
            ],
          ),
            subtitle: Text(
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
