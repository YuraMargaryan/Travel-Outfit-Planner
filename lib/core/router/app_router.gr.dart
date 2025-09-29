// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddEditClothingRoute.name: (routeData) {
      final args = routeData.argsAs<AddEditClothingRouteArgs>(
          orElse: () => const AddEditClothingRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddEditClothingScreen(
          key: args.key,
          clothingItem: args.clothingItem,
        ),
      );
    },
    AddEditOutfitPhotoRoute.name: (routeData) {
      final args = routeData.argsAs<AddEditOutfitPhotoRouteArgs>(
          orElse: () => const AddEditOutfitPhotoRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddEditOutfitPhotoScreen(
          key: args.key,
          outfitPhoto: args.outfitPhoto,
        ),
      );
    },
    AddEditWeatherPlanRoute.name: (routeData) {
      final args = routeData.argsAs<AddEditWeatherPlanRouteArgs>(
          orElse: () => const AddEditWeatherPlanRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddEditWeatherPlanScreen(
          key: args.key,
          weatherPlan: args.weatherPlan,
        ),
      );
    },
    ClothingItemDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ClothingItemDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ClothingItemDetailsScreen(
          key: args.key,
          clothingItem: args.clothingItem,
        ),
      );
    },
    ClothingListsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ClothingListsScreen(),
      );
    },
    CreateTemplateRoute.name: (routeData) {
      final args = routeData.argsAs<CreateTemplateRouteArgs>(
          orElse: () => const CreateTemplateRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateTemplateScreen(
          key: args.key,
          template: args.template,
        ),
      );
    },
    CreateTripRoute.name: (routeData) {
      final args = routeData.argsAs<CreateTripRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateTripScreen(
          key: args.key,
          template: args.template,
        ),
      );
    },
    DailyClothingRoute.name: (routeData) {
      final args = routeData.argsAs<DailyClothingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DailyClothingScreen(
          key: args.key,
          tripId: args.tripId,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardingRouteArgs>(
          orElse: () => const OnboardingRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OnboardingScreen(
          key: args.key,
          onCompleted: args.onCompleted,
        ),
      );
    },
    OutfitPhotosRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OutfitPhotosScreen(),
      );
    },
    SettingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingScreen(),
      );
    },
    TripTemplatesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TripTemplatesScreen(),
      );
    },
    WeatherPlansRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WeatherPlansScreen(),
      );
    },
  };
}

/// generated route for
/// [AddEditClothingScreen]
class AddEditClothingRoute extends PageRouteInfo<AddEditClothingRouteArgs> {
  AddEditClothingRoute({
    Key? key,
    ClothingItem? clothingItem,
    List<PageRouteInfo>? children,
  }) : super(
          AddEditClothingRoute.name,
          args: AddEditClothingRouteArgs(
            key: key,
            clothingItem: clothingItem,
          ),
          initialChildren: children,
        );

  static const String name = 'AddEditClothingRoute';

  static const PageInfo<AddEditClothingRouteArgs> page =
      PageInfo<AddEditClothingRouteArgs>(name);
}

class AddEditClothingRouteArgs {
  const AddEditClothingRouteArgs({
    this.key,
    this.clothingItem,
  });

  final Key? key;

  final ClothingItem? clothingItem;

  @override
  String toString() {
    return 'AddEditClothingRouteArgs{key: $key, clothingItem: $clothingItem}';
  }
}

/// generated route for
/// [AddEditOutfitPhotoScreen]
class AddEditOutfitPhotoRoute
    extends PageRouteInfo<AddEditOutfitPhotoRouteArgs> {
  AddEditOutfitPhotoRoute({
    Key? key,
    OutfitPhoto? outfitPhoto,
    List<PageRouteInfo>? children,
  }) : super(
          AddEditOutfitPhotoRoute.name,
          args: AddEditOutfitPhotoRouteArgs(
            key: key,
            outfitPhoto: outfitPhoto,
          ),
          initialChildren: children,
        );

  static const String name = 'AddEditOutfitPhotoRoute';

  static const PageInfo<AddEditOutfitPhotoRouteArgs> page =
      PageInfo<AddEditOutfitPhotoRouteArgs>(name);
}

class AddEditOutfitPhotoRouteArgs {
  const AddEditOutfitPhotoRouteArgs({
    this.key,
    this.outfitPhoto,
  });

  final Key? key;

  final OutfitPhoto? outfitPhoto;

  @override
  String toString() {
    return 'AddEditOutfitPhotoRouteArgs{key: $key, outfitPhoto: $outfitPhoto}';
  }
}

/// generated route for
/// [AddEditWeatherPlanScreen]
class AddEditWeatherPlanRoute
    extends PageRouteInfo<AddEditWeatherPlanRouteArgs> {
  AddEditWeatherPlanRoute({
    Key? key,
    WeatherPlan? weatherPlan,
    List<PageRouteInfo>? children,
  }) : super(
          AddEditWeatherPlanRoute.name,
          args: AddEditWeatherPlanRouteArgs(
            key: key,
            weatherPlan: weatherPlan,
          ),
          initialChildren: children,
        );

  static const String name = 'AddEditWeatherPlanRoute';

  static const PageInfo<AddEditWeatherPlanRouteArgs> page =
      PageInfo<AddEditWeatherPlanRouteArgs>(name);
}

class AddEditWeatherPlanRouteArgs {
  const AddEditWeatherPlanRouteArgs({
    this.key,
    this.weatherPlan,
  });

  final Key? key;

  final WeatherPlan? weatherPlan;

  @override
  String toString() {
    return 'AddEditWeatherPlanRouteArgs{key: $key, weatherPlan: $weatherPlan}';
  }
}

/// generated route for
/// [ClothingItemDetailsScreen]
class ClothingItemDetailsRoute
    extends PageRouteInfo<ClothingItemDetailsRouteArgs> {
  ClothingItemDetailsRoute({
    Key? key,
    required ClothingItem clothingItem,
    List<PageRouteInfo>? children,
  }) : super(
          ClothingItemDetailsRoute.name,
          args: ClothingItemDetailsRouteArgs(
            key: key,
            clothingItem: clothingItem,
          ),
          initialChildren: children,
        );

  static const String name = 'ClothingItemDetailsRoute';

  static const PageInfo<ClothingItemDetailsRouteArgs> page =
      PageInfo<ClothingItemDetailsRouteArgs>(name);
}

class ClothingItemDetailsRouteArgs {
  const ClothingItemDetailsRouteArgs({
    this.key,
    required this.clothingItem,
  });

  final Key? key;

  final ClothingItem clothingItem;

  @override
  String toString() {
    return 'ClothingItemDetailsRouteArgs{key: $key, clothingItem: $clothingItem}';
  }
}

/// generated route for
/// [ClothingListsScreen]
class ClothingListsRoute extends PageRouteInfo<void> {
  const ClothingListsRoute({List<PageRouteInfo>? children})
      : super(
          ClothingListsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ClothingListsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateTemplateScreen]
class CreateTemplateRoute extends PageRouteInfo<CreateTemplateRouteArgs> {
  CreateTemplateRoute({
    Key? key,
    TripTemplate? template,
    List<PageRouteInfo>? children,
  }) : super(
          CreateTemplateRoute.name,
          args: CreateTemplateRouteArgs(
            key: key,
            template: template,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateTemplateRoute';

  static const PageInfo<CreateTemplateRouteArgs> page =
      PageInfo<CreateTemplateRouteArgs>(name);
}

class CreateTemplateRouteArgs {
  const CreateTemplateRouteArgs({
    this.key,
    this.template,
  });

  final Key? key;

  final TripTemplate? template;

  @override
  String toString() {
    return 'CreateTemplateRouteArgs{key: $key, template: $template}';
  }
}

/// generated route for
/// [CreateTripScreen]
class CreateTripRoute extends PageRouteInfo<CreateTripRouteArgs> {
  CreateTripRoute({
    Key? key,
    required TripTemplate template,
    List<PageRouteInfo>? children,
  }) : super(
          CreateTripRoute.name,
          args: CreateTripRouteArgs(
            key: key,
            template: template,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateTripRoute';

  static const PageInfo<CreateTripRouteArgs> page =
      PageInfo<CreateTripRouteArgs>(name);
}

class CreateTripRouteArgs {
  const CreateTripRouteArgs({
    this.key,
    required this.template,
  });

  final Key? key;

  final TripTemplate template;

  @override
  String toString() {
    return 'CreateTripRouteArgs{key: $key, template: $template}';
  }
}

/// generated route for
/// [DailyClothingScreen]
class DailyClothingRoute extends PageRouteInfo<DailyClothingRouteArgs> {
  DailyClothingRoute({
    Key? key,
    required int tripId,
    List<PageRouteInfo>? children,
  }) : super(
          DailyClothingRoute.name,
          args: DailyClothingRouteArgs(
            key: key,
            tripId: tripId,
          ),
          initialChildren: children,
        );

  static const String name = 'DailyClothingRoute';

  static const PageInfo<DailyClothingRouteArgs> page =
      PageInfo<DailyClothingRouteArgs>(name);
}

class DailyClothingRouteArgs {
  const DailyClothingRouteArgs({
    this.key,
    required this.tripId,
  });

  final Key? key;

  final int tripId;

  @override
  String toString() {
    return 'DailyClothingRouteArgs{key: $key, tripId: $tripId}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({
    Key? key,
    void Function()? onCompleted,
    List<PageRouteInfo>? children,
  }) : super(
          OnboardingRoute.name,
          args: OnboardingRouteArgs(
            key: key,
            onCompleted: onCompleted,
          ),
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<OnboardingRouteArgs> page =
      PageInfo<OnboardingRouteArgs>(name);
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({
    this.key,
    this.onCompleted,
  });

  final Key? key;

  final void Function()? onCompleted;

  @override
  String toString() {
    return 'OnboardingRouteArgs{key: $key, onCompleted: $onCompleted}';
  }
}

/// generated route for
/// [OutfitPhotosScreen]
class OutfitPhotosRoute extends PageRouteInfo<void> {
  const OutfitPhotosRoute({List<PageRouteInfo>? children})
      : super(
          OutfitPhotosRoute.name,
          initialChildren: children,
        );

  static const String name = 'OutfitPhotosRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingScreen]
class SettingRoute extends PageRouteInfo<void> {
  const SettingRoute({List<PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TripTemplatesScreen]
class TripTemplatesRoute extends PageRouteInfo<void> {
  const TripTemplatesRoute({List<PageRouteInfo>? children})
      : super(
          TripTemplatesRoute.name,
          initialChildren: children,
        );

  static const String name = 'TripTemplatesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WeatherPlansScreen]
class WeatherPlansRoute extends PageRouteInfo<void> {
  const WeatherPlansRoute({List<PageRouteInfo>? children})
      : super(
          WeatherPlansRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeatherPlansRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
