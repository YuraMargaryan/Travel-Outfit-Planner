import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_outfit_planne/core/database/app_database.dart';
import 'package:travel_outfit_planne/core/providers/database_provider.dart';
import 'package:travel_outfit_planne/core/router/app_router.dart';

@RoutePage()
class WeatherPlansScreen extends StatefulWidget {
  const WeatherPlansScreen({super.key});

  @override
  State<WeatherPlansScreen> createState() => _WeatherPlansScreenState();
}

class _WeatherPlansScreenState extends State<WeatherPlansScreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    ));

    _fadeController.forward();
    _slideController.forward();
    _scaleController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Weather Plans',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.5,
          ),
        ),
        backgroundColor: CupertinoColors.systemBackground,
      ),
      child: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Column(
              children: [
                // Animated header
                AnimatedBuilder(
                  animation: _scaleAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              CupertinoColors.systemYellow,
                              CupertinoColors.systemOrange,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: CupertinoColors.systemYellow.withOpacity(0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                            BoxShadow(
                              color: CupertinoColors.systemYellow.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    CupertinoColors.white.withOpacity(0.9),
                                    CupertinoColors.white.withOpacity(0.7),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: CupertinoColors.black.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                CupertinoIcons.cloud_sun,
                                size: 32,
                                color: CupertinoColors.systemOrange,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Weather Plans',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.5,
                                      color: CupertinoColors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Consumer<DatabaseProvider>(
                                    builder: (context, databaseProvider, child) {
                                      return FutureBuilder<List<WeatherPlan>>(
                                        future: databaseProvider.database.getAllWeatherPlans(),
                                        builder: (context, snapshot) {
                                          final count = snapshot.data?.length ?? 0;
                                          return Text(
                                            'Total plans: $count',
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: CupertinoColors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: CupertinoColors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: CupertinoColors.white.withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: CupertinoButton(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                onPressed: _addWeatherPlan,
                                child: const Text(
                                  'Add',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: CupertinoColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                // Plans list
                Expanded(
                  child: Consumer<DatabaseProvider>(
                    builder: (context, databaseProvider, child) {
                      return FutureBuilder<List<WeatherPlan>>(
                        future: databaseProvider.database.getAllWeatherPlans(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(
                              child: CupertinoActivityIndicator(
                                radius: 20,
                                color: CupertinoColors.systemBlue,
                              ),
                            );
                          }

                          if (snapshot.hasError) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    CupertinoIcons.exclamationmark_triangle,
                                    size: 64,
                                    color: CupertinoColors.systemRed,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Error loading plans',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: CupertinoColors.systemRed,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '${snapshot.error}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: CupertinoColors.secondaryLabel,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          }

                          final plans = snapshot.data ?? [];

                          if (plans.isEmpty) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          CupertinoColors.systemYellow.withOpacity(0.1),
                                          CupertinoColors.systemOrange.withOpacity(0.1),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: const Icon(
                                      CupertinoIcons.cloud_sun,
                                      size: 64,
                                      color: CupertinoColors.systemOrange,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  const Text(
                                    'No weather plans',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.5,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Create your first plan\nfor weather-based outfit planning',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: CupertinoColors.secondaryLabel,
                                      height: 1.3,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 32),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          CupertinoColors.systemBlue,
                                          CupertinoColors.systemPurple,
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                          color: CupertinoColors.systemBlue.withOpacity(0.3),
                                          blurRadius: 12,
                                          offset: const Offset(0, 6),
                                        ),
                                      ],
                                    ),
                                    child: CupertinoButton(
                                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                                      onPressed: _addWeatherPlan,
                                      child: const Text(
                                        'Create Plan',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -0.5,
                                          color: CupertinoColors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          return ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            itemCount: plans.length,
                            itemBuilder: (context, index) {
                              final plan = plans[index];
                              return _buildWeatherPlanCard(plan, index, plans);
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherPlanCard(WeatherPlan plan, int index, List<WeatherPlan> allPlans) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 600 + (index * 100)),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.8 + (0.2 * value),
          child: Opacity(
            opacity: value.clamp(0.0, 1.0),
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: CupertinoColors.systemGrey5,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.systemGrey.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                  BoxShadow(
                    color: CupertinoColors.systemGrey.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Hero(
                        tag: 'weather_plan_${plan.id}',
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: _getWeatherGradient(plan.weatherType),
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: _getWeatherColor(plan.weatherType).withOpacity(0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Icon(
                            _getWeatherIcon(plan.weatherType),
                            size: 32,
                            color: CupertinoColors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              plan.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.5,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              plan.location,
                              style: const TextStyle(
                                fontSize: 14,
                                color: CupertinoColors.secondaryLabel,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: _getWeatherColor(plan.weatherType).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: _getWeatherColor(plan.weatherType).withOpacity(0.3),
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    _getWeatherTypeText(plan.weatherType),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: _getWeatherColor(plan.weatherType),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: CupertinoColors.systemGrey6,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: CupertinoColors.systemGrey4,
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    '${plan.temperature}°C',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: CupertinoColors.systemGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: CupertinoColors.systemGrey6,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: CupertinoColors.systemGrey4,
                                width: 1,
                              ),
                            ),
                            child: CupertinoButton(
                              padding: const EdgeInsets.all(10),
                              onPressed: () => _editWeatherPlan(plan),
                              child: const Icon(
                                CupertinoIcons.pencil,
                                color: CupertinoColors.systemOrange,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: CupertinoColors.systemGrey6,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: CupertinoColors.systemGrey4,
                                width: 1,
                              ),
                            ),
                            child: CupertinoButton(
                              padding: const EdgeInsets.all(10),
                              onPressed: () => _deleteWeatherPlan(plan),
                              child: const Icon(
                                CupertinoIcons.delete,
                                color: CupertinoColors.systemRed,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (plan.description != null && plan.description!.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Text(
                      plan.description!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.secondaryLabel,
                        height: 1.3,
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                CupertinoColors.systemBlue,
                                CupertinoColors.systemPurple,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: CupertinoColors.systemBlue.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () => _showWeatherPlanDetails(plan),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                child: const Text(
                                  'View',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: CupertinoColors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _addWeatherPlan() {
    context.router.push(AddEditWeatherPlanRoute()).then((result) {
      if (result == true && mounted) {
        setState(() {});
      }
    });
  }

  void _showWeatherPlanDetails(WeatherPlan plan) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: Text(plan.name),
        message: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: _getWeatherGradient(plan.weatherType),
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    _getWeatherIcon(plan.weatherType),
                    size: 16,
                    color: CupertinoColors.white,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Location: ${plan.location}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getWeatherColor(plan.weatherType).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _getWeatherColor(plan.weatherType).withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    _getWeatherTypeText(plan.weatherType),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: _getWeatherColor(plan.weatherType),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey6,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: CupertinoColors.systemGrey4,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    '${plan.temperature}°C',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ),
              ],
            ),
            if (plan.description != null && plan.description!.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                'Description:',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: CupertinoColors.label,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                plan.description!,
                style: const TextStyle(
                  fontSize: 14,
                  color: CupertinoColors.secondaryLabel,
                  height: 1.3,
                ),
              ),
            ],
            const SizedBox(height: 8),
            Text(
              'Created: ${_formatDate(plan.createdAt)}',
              style: const TextStyle(
                fontSize: 12,
                color: CupertinoColors.tertiaryLabel,
              ),
            ),
          ],
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _editWeatherPlan(WeatherPlan plan) {
    context.router.push(AddEditWeatherPlanRoute(weatherPlan: plan)).then((result) {
      if (result == true && mounted) {
        setState(() {});
      }
    });
  }

  void _deleteWeatherPlan(WeatherPlan plan) async {
    final confirmed = await showCupertinoDialog<bool>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Delete Plan'),
        content: Text('Are you sure you want to delete plan "${plan.name}"?'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: const Text('Delete'),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final databaseProvider = Provider.of<DatabaseProvider>(context, listen: false);
      await databaseProvider.database.deleteWeatherPlan(plan.id);
      setState(() {});
      _showSuccessMessage('Plan deleted successfully!');
    }
  }

  void _showSuccessMessage(String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Success'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  List<Color> _getWeatherGradient(String weatherType) {
    switch (weatherType.toLowerCase()) {
      case 'sunny':
        return [CupertinoColors.systemYellow, CupertinoColors.systemOrange];
      case 'cloudy':
        return [CupertinoColors.systemGrey, CupertinoColors.systemGrey2];
      case 'rainy':
        return [CupertinoColors.systemBlue, CupertinoColors.systemIndigo];
      case 'snowy':
        return [CupertinoColors.systemGrey6, CupertinoColors.white];
      case 'windy':
        return [CupertinoColors.systemTeal, CupertinoColors.systemCyan];
      default:
        return [CupertinoColors.systemBlue, CupertinoColors.systemPurple];
    }
  }

  Color _getWeatherColor(String weatherType) {
    switch (weatherType.toLowerCase()) {
      case 'sunny':
        return CupertinoColors.systemOrange;
      case 'cloudy':
        return CupertinoColors.systemGrey;
      case 'rainy':
        return CupertinoColors.systemBlue;
      case 'snowy':
        return CupertinoColors.systemGrey2;
      case 'windy':
        return CupertinoColors.systemTeal;
      default:
        return CupertinoColors.systemBlue;
    }
  }

  IconData _getWeatherIcon(String weatherType) {
    switch (weatherType.toLowerCase()) {
      case 'sunny':
        return CupertinoIcons.sun_max;
      case 'cloudy':
        return CupertinoIcons.cloud;
      case 'rainy':
        return CupertinoIcons.cloud_rain;
      case 'snowy':
        return CupertinoIcons.cloud_snow;
      case 'windy':
        return CupertinoIcons.wind;
      default:
        return CupertinoIcons.cloud_sun;
    }
  }

  String _getWeatherTypeText(String weatherType) {
    switch (weatherType.toLowerCase()) {
      case 'sunny':
        return 'Sunny';
      case 'cloudy':
        return 'Cloudy';
      case 'rainy':
        return 'Rainy';
      case 'snowy':
        return 'Snowy';
      case 'windy':
        return 'Windy';
      default:
        return 'Unknown';
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
  }
}
