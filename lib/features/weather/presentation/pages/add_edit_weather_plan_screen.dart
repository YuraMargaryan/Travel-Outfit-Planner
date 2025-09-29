import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_outfit_planne/core/database/app_database.dart';
import 'package:travel_outfit_planne/core/providers/database_provider.dart';
import 'package:drift/drift.dart' as drift;

@RoutePage()
class AddEditWeatherPlanScreen extends StatefulWidget {
  final WeatherPlan? weatherPlan;

  const AddEditWeatherPlanScreen({super.key, this.weatherPlan});

  @override
  State<AddEditWeatherPlanScreen> createState() => _AddEditWeatherPlanScreenState();
}

class _AddEditWeatherPlanScreenState extends State<AddEditWeatherPlanScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _temperatureController = TextEditingController();
  
  String _selectedWeatherType = 'sunny';
  bool _isLoading = false;

  final List<Map<String, dynamic>> _weatherTypes = [
    {'value': 'sunny', 'label': 'Sunny', 'icon': CupertinoIcons.sun_max},
    {'value': 'cloudy', 'label': 'Cloudy', 'icon': CupertinoIcons.cloud},
    {'value': 'rainy', 'label': 'Rainy', 'icon': CupertinoIcons.cloud_rain},
    {'value': 'snowy', 'label': 'Snowy', 'icon': CupertinoIcons.cloud_snow},
    {'value': 'windy', 'label': 'Windy', 'icon': CupertinoIcons.wind},
  ];

  @override
  void initState() {
    super.initState();
    if (widget.weatherPlan != null) {
      _nameController.text = widget.weatherPlan!.name;
      _locationController.text = widget.weatherPlan!.location;
      _descriptionController.text = widget.weatherPlan!.description ?? '';
      _temperatureController.text = widget.weatherPlan!.temperature.toString();
      _selectedWeatherType = widget.weatherPlan!.weatherType;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    _temperatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          widget.weatherPlan != null ? 'Edit Plan' : 'New Plan',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.5,
          ),
        ),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => context.router.maybePop(),
          child: const Text(
            'Cancel',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: _isLoading ? null : _saveWeatherPlan,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: CupertinoColors.systemBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              widget.weatherPlan != null ? 'Update' : 'Save',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: CupertinoColors.white,
              ),
            ),
          ),
        ),
        backgroundColor: CupertinoColors.systemBackground,
      ),
      child: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // Plan information
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: CupertinoColors.systemGrey5,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.systemGrey.withOpacity(0.1),
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
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: _getWeatherGradient(_selectedWeatherType),
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            _getWeatherIcon(_selectedWeatherType),
                            size: 28,
                            color: CupertinoColors.white,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.weatherPlan != null ? 'Edit Plan' : 'New Weather Plan',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Create a plan for planning outfits by weather',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: CupertinoColors.secondaryLabel,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Plan name
              _buildFieldTitle('Plan Name'),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: CupertinoColors.systemGrey5,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.systemGrey.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: CupertinoTextFormFieldRow(
                  controller: _nameController,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  placeholder: 'Enter plan name',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: const BoxDecoration(),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Location
              _buildFieldTitle('Location'),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: CupertinoColors.systemGrey5,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.systemGrey.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: CupertinoTextFormFieldRow(
                  controller: _locationController,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  placeholder: 'Enter location',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: const BoxDecoration(),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Location is required';
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Weather type
              _buildFieldTitle('Weather Type'),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: CupertinoColors.systemGrey5,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.systemGrey.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  onPressed: _showWeatherTypePicker,
                  child: Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: _getWeatherGradient(_selectedWeatherType),
                            begin: Alignment.topLeft,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          _getWeatherIcon(_selectedWeatherType),
                          size: 20,
                          color: CupertinoColors.white,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _getWeatherTypeLabel(_selectedWeatherType),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: CupertinoColors.label,
                          ),
                        ),
                      ),
                      const Icon(
                        CupertinoIcons.chevron_right,
                        size: 20,
                        color: CupertinoColors.systemGrey,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Temperature
              _buildFieldTitle('Temperature (°C)'),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: CupertinoColors.systemGrey5,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.systemGrey.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: CupertinoTextFormFieldRow(
                  controller: _temperatureController,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  placeholder: 'Enter temperature',
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: const BoxDecoration(),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Temperature is required';
                    }
                    final temp = int.tryParse(value.trim());
                    if (temp == null) {
                      return 'Enter valid temperature';
                    }
                    if (temp < -50 || temp > 50) {
                      return 'Temperature should be between -50 and 50°C';
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Description
              _buildFieldTitle('Description (optional)'),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: CupertinoColors.systemGrey5,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.systemGrey.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: CupertinoTextFormFieldRow(
                  controller: _descriptionController,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  placeholder: 'Enter plan description',
                  maxLines: 3,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: const BoxDecoration(),
                ),
              ),

              const SizedBox(height: 32),

              // Save button
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
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: _isLoading ? null : _saveWeatherPlan,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: _isLoading
                          ? const CupertinoActivityIndicator(
                              color: CupertinoColors.white,
                              radius: 16,
                            )
                          : Text(
                              widget.weatherPlan != null ? 'Update Plan' : 'Create Plan',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.5,
                                color: CupertinoColors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFieldTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.3,
        color: CupertinoColors.label,
      ),
    );
  }

  void _showWeatherTypePicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('Select Weather Type'),
        actions: _weatherTypes.map((type) {
          return CupertinoActionSheetAction(
            onPressed: () {
              setState(() {
                _selectedWeatherType = type['value'];
              });
              context.router.maybePop();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: _getWeatherGradient(type['value']),
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    type['icon'],
                    size: 16,
                    color: CupertinoColors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  type['label'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => context.router.maybePop(),
          child: const Text('Cancel'),
        ),
      ),
    );
  }

  void _saveWeatherPlan() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final databaseProvider = Provider.of<DatabaseProvider>(context, listen: false);
      
      if (widget.weatherPlan != null) {
        // Updating existing plan
        await databaseProvider.database.updateWeatherPlan(
          widget.weatherPlan!.id,
          _nameController.text.trim(),
          _locationController.text.trim(),
          _selectedWeatherType,
          int.parse(_temperatureController.text.trim()),
          _descriptionController.text.trim().isEmpty 
              ? null 
              : _descriptionController.text.trim(),
        );
      } else {
        // Creating new plan
        await databaseProvider.database.insertWeatherPlan(
          WeatherPlansCompanion.insert(
            name: _nameController.text.trim(),
            location: _locationController.text.trim(),
            weatherType: _selectedWeatherType,
            temperature: int.parse(_temperatureController.text.trim()),
            description: _descriptionController.text.trim().isEmpty 
                ? const drift.Value.absent() 
                : drift.Value(_descriptionController.text.trim()),
            createdAt: drift.Value(DateTime.now()),
          ),
        );
      }
      
      if (mounted) {
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        _showErrorMessage('Error: $e');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showSuccessMessageAndClose(String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Success'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () {
              context.router.maybePop(); // Close dialog
              context.router.maybePop(true); // Close creation screen
            },
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
            onPressed: () => context.router.maybePop(),
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

  String _getWeatherTypeLabel(String weatherType) {
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
}
