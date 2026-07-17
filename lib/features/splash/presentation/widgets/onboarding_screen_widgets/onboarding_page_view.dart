import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
            backgroundImage: Assets.backgrounfimage1,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 76.5),
              child: SvgPicture.asset(Assets.welcomeToFruitHub),
            ),
            subtitle: 
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
            
          ),
          OnboardingPageViewItem(image: Assets.assetsImagesPineappleCuate, backgroundImage: Assets.backgroundofbunble, title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 76.5),
              child: Text('ابحث وتسوق ',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
            ), subtitle: 'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية')
        ],
      ),
    );
  }
}
