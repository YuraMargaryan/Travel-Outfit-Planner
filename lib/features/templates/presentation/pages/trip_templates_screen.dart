import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart' hide CupertinoPageRoute;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/providers/database_provider.dart';
import '../../../../core/database/app_database.dart';
import 'create_trip_screen.dart';
import 'create_template_screen.dart';

@RoutePage()
class TripTemplatesScreen extends StatefulWidget {
  const TripTemplatesScreen({super.key});

  @override
  State<TripTemplatesScreen> createState() => _TripTemplatesScreenState();
}

class _TripTemplatesScreenState extends State<TripTemplatesScreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;
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
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          _selectedIndex == 0 ? 'Trip Templates' : 'My Trips',
          style: const TextStyle(
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
                // Animated segmented control
                AnimatedBuilder(
                  animation: _scaleAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              CupertinoColors.systemGrey6,
                              CupertinoColors.systemGrey6.withOpacity(0.8),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: CupertinoColors.systemGrey.withOpacity(0.15),
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
                        child: CupertinoSlidingSegmentedControl<int>(
                          groupValue: _selectedIndex,
                          onValueChanged: (value) {
                            setState(() {
                              _selectedIndex = value ?? 0;
                            });
                            // Animation on switch
                            _scaleController.reset();
                            _scaleController.forward();
                          },
                          children: const {
                            0: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              child: Text(
                                'Templates',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.3,
                                ),
                              ),
                            ),
                            1: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              child: Text(
                                'My Trips',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.3,
                                ),
                              ),
                            ),
                          },
                        ),
                      ),
                    );
                  },
                ),
                
                // Content based on selected tab
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(1.0, 0.0),
                          end: Offset.zero,
                        ).animate(CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeInOut,
                        )),
                        child: FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                      );
                    },
                    child: _selectedIndex == 0 ? _buildTemplatesTab() : _buildTripsTab(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTemplateCard(TripTemplate template) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.8 + (0.2 * value),
          child: Opacity(
            opacity: value.clamp(0.0, 1.0),
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    CupertinoColors.systemBackground,
                    CupertinoColors.systemBackground.withOpacity(0.95),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.systemGrey.withOpacity(0.12),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                  BoxShadow(
                    color: CupertinoColors.systemGrey.withOpacity(0.06),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(
                  color: CupertinoColors.systemGrey5.withOpacity(0.3),
                  width: 1,
                ),
              ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'template_icon_${template.id}',
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          _getTemplateColor(template.season ?? 'all'),
                          _getTemplateColor(template.season ?? 'all').withOpacity(0.7),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: _getTemplateColor(template.season ?? 'all').withOpacity(0.5),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        ),
                        BoxShadow(
                          color: _getTemplateColor(template.season ?? 'all').withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      _getTemplateIcon(template.name),
                      color: CupertinoColors.white,
                      size: 32,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        template.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: CupertinoColors.label,
                          letterSpacing: -0.8,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: _getTemplateColor(template.season ?? 'all').withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: _getTemplateColor(template.season ?? 'all').withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          'Template',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: _getTemplateColor(template.season ?? 'all'),
                          ),
                        ),
                      ),
                      if (template.description != null) ...[
                        const SizedBox(height: 12),
                        Text(
                          template.description!,
                          style: const TextStyle(
                            fontSize: 15,
                            color: CupertinoColors.secondaryLabel,
                            height: 1.4,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Column(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            CupertinoColors.activeBlue,
                            CupertinoColors.activeBlue.withOpacity(0.8),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: CupertinoColors.activeBlue.withOpacity(0.5),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                          BoxShadow(
                            color: CupertinoColors.activeBlue.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(18),
                          onTap: () => _useTemplate(template),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            child: const Text(
                              'Use',
                              style: TextStyle(
                                color: CupertinoColors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.3,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey6,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: CupertinoColors.systemGrey4,
                          width: 1,
                        ),
                      ),
                      child: CupertinoButton(
                        padding: const EdgeInsets.all(10),
                        onPressed: () => _showTemplateOptions(template),
                        child: const Icon(
                          CupertinoIcons.ellipsis,
                          color: CupertinoColors.systemGrey,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (template.season != null || template.duration != null) ...[
              const SizedBox(height: 20),
              Row(
                children: [
                  if (template.season != null) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: _getTemplateColor(template.season!).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _getTemplateColor(template.season!).withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        _getSeasonName(template.season!),
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: _getTemplateColor(template.season!),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                  if (template.duration != null) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey6,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: CupertinoColors.systemGrey4,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        _getDurationName(template.duration!),
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: CupertinoColors.secondaryLabel,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ],
        ),
      ),
            ),
          ),
        );
      },
    );
  }

  Color _getTemplateColor(String season) {
    switch (season) {
      case 'summer':
        return CupertinoColors.activeOrange;
      case 'winter':
        return CupertinoColors.activeBlue;
      case 'spring':
        return CupertinoColors.activeGreen;
      case 'autumn':
        return CupertinoColors.systemBrown;
      default:
        return CupertinoColors.systemGrey;
    }
  }

  IconData _getTemplateIcon(String name) {
    if (name.contains('Business') || name.contains('Деловая')) {
      return CupertinoIcons.briefcase;
    } else if (name.contains('Beach') || name.contains('Пляжный')) {
      return CupertinoIcons.sun_max;
    } else if (name.contains('Ski') || name.contains('Горнолыжный')) {
      return CupertinoIcons.snow;
    } else if (name.contains('City') || name.contains('Городской')) {
      return CupertinoIcons.home;
    }
    return CupertinoIcons.airplane;
  }

  String _getSeasonName(String season) {
    switch (season) {
      case 'summer':
        return 'Summer';
      case 'winter':
        return 'Winter';
      case 'spring':
        return 'Spring';
      case 'autumn':
        return 'Autumn';
      case 'all':
        return 'All Seasons';
      default:
        return season;
    }
  }

  String _getDurationName(String duration) {
    switch (duration) {
      case 'weekend':
        return 'Weekend';
      case 'week':
        return 'Week';
      case 'month':
        return 'Month';
      default:
        return duration;
    }
  }

  void _useTemplate(TripTemplate template) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Use Template'),
        content: Text('Create trip based on template "${template.name}"?'),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Create'),
            onPressed: () {
              Navigator.of(context).pop();
              _createTripFromTemplate(template);
            },
          ),
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void _createTripFromTemplate(TripTemplate template) async {
    final result = await Navigator.of(context).push<bool>(
      CupertinoPageRoute(
        builder: (context) => CreateTripScreen(template: template),
      ),
    );
    
    if (result == true) {
      setState(() {}); // Update list
    }
  }

  void _createCustomTemplate() async {
    final result = await Navigator.of(context).push<bool>(
      CupertinoPageRoute(
        builder: (context) => const CreateTemplateScreen(),
      ),
    );
    
    if (result == true) {
      setState(() {}); // Update list
    }
  }
  
  void _showTemplateOptions(TripTemplate template) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: Text(template.name),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop();
              _editTemplate(template);
            },
            child: const Text('Edit'),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(context).pop();
              _deleteTemplate(template);
            },
            child: const Text('Delete'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ),
    );
  }
  
  void _editTemplate(TripTemplate template) async {
    final result = await Navigator.of(context).push<bool>(
      CupertinoPageRoute(
        builder: (context) => CreateTemplateScreen(template: template),
      ),
    );
    
    if (result == true) {
      setState(() {}); // Update list
    }
  }
  
  void _deleteTemplate(TripTemplate template) async {
    final confirmed = await showCupertinoDialog<bool>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Delete Template'),
        content: Text('Are you sure you want to delete template "${template.name}"?'),
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

    if (confirmed != true) return;

    try {
      final databaseProvider = Provider.of<DatabaseProvider>(context, listen: false);
      await databaseProvider.database.deleteTemplate(template.id);
      
      if (mounted) {
        setState(() {}); // Update list
        _showSuccessMessage('Template deleted');
      }
    } catch (e) {
      if (mounted) {
        _showErrorMessage('Error: $e');
      }
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

  void _showErrorMessage(String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Error'),
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

  Widget _buildTemplatesTab() {
    return Consumer<DatabaseProvider>(
      builder: (context, databaseProvider, child) {
        if (!databaseProvider.isInitialized) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        return FutureBuilder<List<TripTemplate>>(
          future: databaseProvider.database.getAllTemplates(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CupertinoActivityIndicator(),
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
                    const Text(
                      'Error loading data',
                      style: TextStyle(
                        fontSize: 18,
                        color: CupertinoColors.label,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      snapshot.error.toString(),
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

            final templates = snapshot.data ?? [];

            if (templates.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              CupertinoColors.activeBlue.withOpacity(0.1),
                              CupertinoColors.activeBlue.withOpacity(0.05),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: const Icon(
                          CupertinoIcons.airplane,
                          size: 48,
                          color: CupertinoColors.activeBlue,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'No templates found',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: CupertinoColors.label,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Create your first trip template',
                        style: TextStyle(
                          fontSize: 16,
                          color: CupertinoColors.secondaryLabel,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      Container(
                        decoration: BoxDecoration(
                          color: CupertinoColors.activeBlue,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: CupertinoColors.activeBlue.withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: CupertinoButton(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          onPressed: _createCustomTemplate,
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                CupertinoIcons.add,
                                color: CupertinoColors.white,
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Create Template',
                                style: TextStyle(
                                  color: CupertinoColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return Column(
              children: [
                // Header with template count
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        CupertinoColors.activeBlue.withOpacity(0.1),
                        CupertinoColors.activeBlue.withOpacity(0.05),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.activeBlue.withOpacity(0.1),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(
                      color: CupertinoColors.activeBlue.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: CupertinoColors.activeBlue,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  CupertinoIcons.airplane,
                                  color: CupertinoColors.white,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'Trip Templates',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: CupertinoColors.label,
                                  letterSpacing: -0.8,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Templates available: ${templates.length}',
                            style: const TextStyle(
                              fontSize: 15,
                              color: CupertinoColors.secondaryLabel,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              CupertinoColors.activeBlue,
                              CupertinoColors.activeBlue.withOpacity(0.8),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: CupertinoColors.activeBlue.withOpacity(0.4),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: CupertinoButton(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          onPressed: _createCustomTemplate,
                          child: const Text(
                            'Create',
                            style: TextStyle(
                              color: CupertinoColors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.3,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Template list
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: templates.length,
                    itemBuilder: (context, index) {
                      final template = templates[index];
                      return _buildTemplateCard(template);
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildTripsTab() {
    return Consumer<DatabaseProvider>(
      builder: (context, databaseProvider, child) {
        if (!databaseProvider.isInitialized) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        return FutureBuilder<List<Trip>>(
          future: databaseProvider.database.getAllTrips(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CupertinoActivityIndicator(),
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
                    const Text(
                      'Error loading data',
                      style: TextStyle(
                        fontSize: 18,
                        color: CupertinoColors.label,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      snapshot.error.toString(),
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

            final trips = snapshot.data ?? [];

            if (trips.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              CupertinoColors.activeBlue.withOpacity(0.1),
                              CupertinoColors.activeBlue.withOpacity(0.05),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: const Icon(
                          CupertinoIcons.airplane,
                          size: 48,
                          color: CupertinoColors.activeBlue,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'You have no trips yet',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: CupertinoColors.label,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Create a trip from template or add a new one',
                        style: TextStyle(
                          fontSize: 16,
                          color: CupertinoColors.secondaryLabel,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      Container(
                        decoration: BoxDecoration(
                          color: CupertinoColors.activeBlue,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: CupertinoColors.activeBlue.withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: CupertinoButton(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          onPressed: () {
                            setState(() {
                              _selectedIndex = 0; // Switch to templates tab
                            });
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                CupertinoIcons.add,
                                color: CupertinoColors.white,
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Create Trip',
                                style: TextStyle(
                                  color: CupertinoColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return Column(
              children: [
                // Header with trip count
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        CupertinoColors.systemGreen.withOpacity(0.1),
                        CupertinoColors.systemGreen.withOpacity(0.05),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.systemGreen.withOpacity(0.1),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(
                      color: CupertinoColors.systemGreen.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: CupertinoColors.systemGreen,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  CupertinoIcons.airplane,
                                  color: CupertinoColors.white,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'My Trips',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                  color: CupertinoColors.label,
                                  letterSpacing: -0.8,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Total trips: ${trips.length}',
                            style: const TextStyle(
                              fontSize: 15,
                              color: CupertinoColors.secondaryLabel,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              CupertinoColors.systemGreen,
                              CupertinoColors.systemGreen.withOpacity(0.8),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: CupertinoColors.systemGreen.withOpacity(0.4),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: CupertinoButton(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          onPressed: () {
                            setState(() {
                              _selectedIndex = 0; // Switch to templates tab
                            });
                          },
                          child: const Text(
                            'Create',
                            style: TextStyle(
                              color: CupertinoColors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.3,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Trip list
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: trips.length,
                    itemBuilder: (context, index) {
                      final trip = trips[index];
                      return _buildTripCard(trip);
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildTripCard(Trip trip) {
    final duration = trip.endDate.difference(trip.startDate).inDays + 1;
    final isActive = trip.startDate.isBefore(DateTime.now()) && trip.endDate.isAfter(DateTime.now());
    final isUpcoming = trip.startDate.isAfter(DateTime.now());
    final isCompleted = trip.endDate.isBefore(DateTime.now());

    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.8 + (0.2 * value),
          child: Opacity(
            opacity: value.clamp(0.0, 1.0),
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    CupertinoColors.systemBackground,
                    CupertinoColors.systemBackground.withOpacity(0.95),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.systemGrey.withOpacity(0.12),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                  BoxShadow(
                    color: CupertinoColors.systemGrey.withOpacity(0.06),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(
                  color: CupertinoColors.systemGrey5.withOpacity(0.3),
                  width: 1,
                ),
              ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'trip_icon_${trip.id}',
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          _getTripStatusColor(isActive, isUpcoming, isCompleted),
                          _getTripStatusColor(isActive, isUpcoming, isCompleted).withOpacity(0.7),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: _getTripStatusColor(isActive, isUpcoming, isCompleted).withOpacity(0.5),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        ),
                        BoxShadow(
                          color: _getTripStatusColor(isActive, isUpcoming, isCompleted).withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      _getTripStatusIcon(isActive, isUpcoming, isCompleted),
                      color: CupertinoColors.white,
                      size: 32,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        trip.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: CupertinoColors.label,
                          letterSpacing: -0.8,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: _getTripStatusColor(isActive, isUpcoming, isCompleted).withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: _getTripStatusColor(isActive, isUpcoming, isCompleted).withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          _getTripStatusText(isActive, isUpcoming, isCompleted),
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: _getTripStatusColor(isActive, isUpcoming, isCompleted),
                          ),
                        ),
                      ),
                      if (trip.destination.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                color: CupertinoColors.systemGrey4,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              trip.destination,
                              style: const TextStyle(
                                fontSize: 15,
                                color: CupertinoColors.secondaryLabel,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey6,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: CupertinoColors.systemGrey4,
                          width: 1,
                        ),
                      ),
                      child: CupertinoButton(
                        padding: const EdgeInsets.all(10),
                        onPressed: () => _showTripDetails(trip),
                        child: const Icon(
                          CupertinoIcons.eye,
                          color: CupertinoColors.activeBlue,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey6,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: CupertinoColors.systemGrey4,
                          width: 1,
                        ),
                      ),
                      child: CupertinoButton(
                        padding: const EdgeInsets.all(10),
                        onPressed: () => _deleteTrip(trip),
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
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey6,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: CupertinoColors.systemGrey4,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    '${_formatDate(trip.startDate)} - ${_formatDate(trip.endDate)}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: CupertinoColors.secondaryLabel,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: CupertinoColors.activeBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: CupertinoColors.activeBlue.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    '$duration ${_getDurationText(duration)}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: CupertinoColors.activeBlue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
            ),
          ),
        );
      },
    );
  }

  Color _getTripStatusColor(bool isActive, bool isUpcoming, bool isCompleted) {
    if (isActive) {
      return CupertinoColors.systemGreen;
    } else if (isUpcoming) {
      return CupertinoColors.activeBlue;
    } else {
      return CupertinoColors.systemGrey;
    }
  }

  IconData _getTripStatusIcon(bool isActive, bool isUpcoming, bool isCompleted) {
    if (isActive) {
      return CupertinoIcons.play_circle;
    } else if (isUpcoming) {
      return CupertinoIcons.clock;
    } else {
      return CupertinoIcons.checkmark_circle;
    }
  }

  String _getTripStatusText(bool isActive, bool isUpcoming, bool isCompleted) {
    if (isActive) {
      return 'Active';
    } else if (isUpcoming) {
      return 'Upcoming';
    } else {
      return 'Completed';
    }
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${date.day} ${months[date.month - 1]}';
  }

  String _getDurationText(int days) {
    if (days == 1) {
      return 'day';
    } else if (days >= 2 && days <= 4) {
      return 'days';
    } else {
      return 'days';
    }
  }

  void _showTripDetails(Trip trip) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(trip.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (trip.destination.isNotEmpty) ...[
              Text('Destination: ${trip.destination}'),
              const SizedBox(height: 8),
            ],
            Text('Dates: ${_formatDate(trip.startDate)} - ${_formatDate(trip.endDate)}'),
            if (trip.description != null) ...[
              const SizedBox(height: 8),
              Text('Description: ${trip.description}'),
            ],
          ],
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void _deleteTrip(Trip trip) async {
    final confirmed = await showCupertinoDialog<bool>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Delete Trip'),
        content: Text('Are you sure you want to delete trip "${trip.name}"?'),
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

    if (confirmed != true) return;

    try {
      final databaseProvider = Provider.of<DatabaseProvider>(context, listen: false);
      await databaseProvider.database.deleteTrip(trip.id);
      
      if (mounted) {
        setState(() {});
        _showSuccessMessage('Trip deleted');
      }
    } catch (e) {
      if (mounted) {
        _showErrorMessage('Error: $e');
      }
    }
  }
}
