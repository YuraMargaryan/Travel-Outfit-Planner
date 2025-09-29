import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/onboarding_service.dart';
import '../../../../core/router/app_router.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  final VoidCallback? onCompleted;
  
  const OnboardingScreen({super.key, this.onCompleted});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: AppConstants.onboardingPages.length,
                itemBuilder: (context, index) {
                  final page = AppConstants.onboardingPages[index];
                  return _buildOnboardingPage(page);
                },
              ),
            ),
            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingPage(OnboardingPage page) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            page.icon,
            style: const TextStyle(fontSize: 80),
          ),
          const SizedBox(height: 32),
          Text(
            page.title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.label,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            page.description,
            style: const TextStyle(
              fontSize: 16,
              color: CupertinoColors.secondaryLabel,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          // Page indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              AppConstants.onboardingPages.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? CupertinoColors.activeBlue
                      : CupertinoColors.systemGrey4,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          // Next/Get Started button
          SizedBox(
            width: double.infinity,
            child: CupertinoButton.filled(
              onPressed: _onNextPressed,
              child: Text(
                _currentPage == AppConstants.onboardingPages.length - 1
                    ? 'Get Started'
                    : 'Next',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Skip button
          if (_currentPage < AppConstants.onboardingPages.length - 1)
            CupertinoButton(
              onPressed: _onSkipPressed,
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: CupertinoColors.secondaryLabel,
                  fontSize: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _onNextPressed() {
    if (_currentPage < AppConstants.onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _onSkipPressed() {
    _completeOnboarding();
  }

  void _completeOnboarding() async {
    await OnboardingService.setOnboardingCompleted();
    
    // If there's a callback, call it
    if (widget.onCompleted != null) {
      widget.onCompleted!();
    } else {
      // Otherwise use navigation (for router compatibility)
      if (mounted) {
        context.router.replace(const HomeRoute());
      }
    }
  }
}
