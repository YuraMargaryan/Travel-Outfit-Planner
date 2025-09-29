import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:travel_outfit_planne/features/home/presentation/pages/home_screen.dart';
import 'package:travel_outfit_planne/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:travel_outfit_planne/features/clothing/presentation/pages/clothing_lists_screen.dart';
import 'package:travel_outfit_planne/features/clothing/presentation/pages/add_edit_clothing_screen.dart';
import 'package:travel_outfit_planne/features/clothing/presentation/pages/daily_clothing_screen.dart';
import 'package:travel_outfit_planne/features/clothing/presentation/pages/clothing_item_details_screen.dart';
import 'package:travel_outfit_planne/features/settings/setting_screen.dart' show SettingScreen;
import 'package:travel_outfit_planne/features/templates/presentation/pages/trip_templates_screen.dart';
import 'package:travel_outfit_planne/features/templates/presentation/pages/create_trip_screen.dart';
import 'package:travel_outfit_planne/features/templates/presentation/pages/create_template_screen.dart';
import 'package:travel_outfit_planne/features/outfit_photos/presentation/pages/outfit_photos_screen.dart';
import 'package:travel_outfit_planne/features/outfit_photos/presentation/pages/add_edit_outfit_photo_screen.dart';
import 'package:travel_outfit_planne/features/outfit_photos/presentation/pages/clothing_selection_screen.dart';
import 'package:travel_outfit_planne/features/weather/presentation/pages/weather_plans_screen.dart';
import 'package:travel_outfit_planne/features/weather/presentation/pages/add_edit_weather_plan_screen.dart';
import 'package:travel_outfit_planne/core/database/app_database.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: OnboardingRoute.page,
    ),
    AutoRoute(
      page: HomeRoute.page,
      initial: true,
    ),
    AutoRoute(
      page: ClothingListsRoute.page,
    ),
    AutoRoute(
      page: DailyClothingRoute.page,
    ),
    AutoRoute(
      page: AddEditClothingRoute.page,
    ),
    AutoRoute(
      page: TripTemplatesRoute.page,
    ),
    AutoRoute(
      page: CreateTripRoute.page,
    ),
    AutoRoute(
      page: CreateTemplateRoute.page,
    ),
    AutoRoute(
      page: ClothingItemDetailsRoute.page,
    ),
    AutoRoute(
      page: OutfitPhotosRoute.page,
    ),
    AutoRoute(
      page: AddEditOutfitPhotoRoute.page,
    ),
    AutoRoute(
      page: ClothingSelectionRoute.page,
    ),
    AutoRoute(
      page: WeatherPlansRoute.page,
    ),
    AutoRoute(
      page: AddEditWeatherPlanRoute.page,
    ),
    AutoRoute(
      page: SettingRoute.page,
    ),
  ];
}