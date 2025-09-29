class AppConstants {
  static const String onboardingKey = 'onboarding_completed';
  static const String appName = 'Travel Outfit Planner';
  
  // Onboarding content
  static const List<OnboardingPage> onboardingPages = [
    OnboardingPage(
      title: 'Welcome!',
      description: 'Plan your travel outfits with ease',
      icon: '👗',
    ),
    OnboardingPage(
      title: 'Daily Planning',
      description: 'Create clothing lists for each day of your trip',
      icon: '📅',
    ),
    OnboardingPage(
      title: 'Weather Consideration',
      description: 'Get recommendations based on weather forecast',
      icon: '🌤️',
    ),
    OnboardingPage(
      title: 'Ready Templates',
      description: 'Use ready-made templates for different types of trips',
      icon: '✈️',
    ),
  ];
}

class OnboardingPage {
  final String title;
  final String description;
  final String icon;

  const OnboardingPage({
    required this.title,
    required this.description,
    required this.icon,
  });
}

