import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_court_scheduling/core/assets/images/images.dart';
import 'package:tennis_court_scheduling/core/i18n/generated/translations.g.dart';
import 'package:tennis_court_scheduling/core/style/style.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/ui/widgets/custom_text.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
        ),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.onboardingImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 90),
            Image.asset(
              Images.logoPath,
              width: 200,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () async {
                  context.go('/login');
                },
                child: CustomText(
                  translate.onboarding.login,
                  style: CustomTextStyles.customTextStylePoppins(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            spaceV20,
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.withAlpha(179)),
                onPressed: () async {
                  context.go('/register');
                },
                child: CustomText(
                  translate.onboarding.register,
                  style: CustomTextStyles.customTextStylePoppins(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
