import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_outfit_planne/core/router/app_router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      navigationBar: CupertinoNavigationBar(
        trailing: IconButton(onPressed: (){context.router.push(const SettingRoute());}, icon: const Icon(CupertinoIcons.settings)),
        backgroundColor: CupertinoColors.systemBackground,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.label,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Plan your travel outfits',
                style: TextStyle(
                  fontSize: 16,
                  color: CupertinoColors.secondaryLabel,
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildFeatureCard(
                      context,
                      'Clothing Lists',
                      '📅',
                      CupertinoColors.activeBlue,
                      () {
                        context.router.push(const ClothingListsRoute());
                      },
                    ),
                    _buildFeatureCard(
                      context,
                      'Weather & Locations',
                      '🌤️',
                      CupertinoColors.activeGreen,
                      () {
                        context.router.push(const WeatherPlansRoute());
                      },
                    ),
                    _buildFeatureCard(
                      context,
                      'Trip Templates',
                      '✈️',
                      CupertinoColors.activeOrange,
                      () {
                        context.router.push(const TripTemplatesRoute());
                      },
                    ),
                    _buildFeatureCard(
                      context,
                      'Outfit Photos',
                      '📸',
                      CupertinoColors.systemPurple,
                      () {
                        context.router.push(const OutfitPhotosRoute());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    String title,
    String icon,
    Color color,
    VoidCallback onTap,
  ) {
    return CupertinoButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey6,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                icon,
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: CupertinoColors.label,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
