import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../core/providers/database_provider.dart';
import '../../../../core/database/app_database.dart';

@RoutePage()
class CreateTripScreen extends StatefulWidget {
  final TripTemplate template;
  
  const CreateTripScreen({
    super.key,
    required this.template,
  });

  @override
  State<CreateTripScreen> createState() => _CreateTripScreenState();
}

class _CreateTripScreenState extends State<CreateTripScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _destinationController = TextEditingController();
  final _descriptionController = TextEditingController();
  
  DateTime? _startDate;
  DateTime? _endDate;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeForm();
  }

  void _initializeForm() {
    _nameController.text = widget.template.name;
    _destinationController.text = widget.template.destination ?? '';
    _descriptionController.text = widget.template.description ?? '';
    
    // Set default dates
    final now = DateTime.now();
    _startDate = now;
    _endDate = now.add(const Duration(days: 7)); // Week by default
  }

  @override
  void dispose() {
    _nameController.dispose();
    _destinationController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          'Create Trip',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.5,
          ),
        ),
        backgroundColor: CupertinoColors.systemBackground,
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.of(context).pop(),
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
          onPressed: _isLoading ? null : _createTrip,
          child: _isLoading 
              ? const CupertinoActivityIndicator()
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: CupertinoColors.activeBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Create',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white,
                    ),
                  ),
                ),
        ),
      ),
      child: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Template information
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemBackground,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.systemGrey.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  border: Border.all(
                    color: CupertinoColors.systemGrey5,
                    width: 1,
                  ),
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
                              colors: [
                                _getTemplateColor(widget.template.season ?? 'all'),
                                _getTemplateColor(widget.template.season ?? 'all').withOpacity(0.8),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: _getTemplateColor(widget.template.season ?? 'all').withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(
                            _getTemplateIcon(widget.template.name),
                            color: CupertinoColors.white,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Template:',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: CupertinoColors.secondaryLabel,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                widget.template.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: CupertinoColors.label,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              if (widget.template.description != null) ...[
                                const SizedBox(height: 6),
                                Text(
                                  widget.template.description!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: CupertinoColors.secondaryLabel,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Trip name
              _buildSection(
                title: 'Trip Name',
                child: Container(
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemBackground,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.systemGrey.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    border: Border.all(
                      color: CupertinoColors.systemGrey5,
                      width: 1,
                    ),
                  ),
                  child: CupertinoTextFormFieldRow(
                    controller: _nameController,
                    placeholder: 'Enter trip name',
                    style: const TextStyle(
                      fontSize: 16,
                      color: CupertinoColors.label,
                      fontWeight: FontWeight.w500,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: const BoxDecoration(),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Destination
              _buildSection(
                title: 'Destination',
                child: Container(
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemBackground,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.systemGrey.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    border: Border.all(
                      color: CupertinoColors.systemGrey5,
                      width: 1,
                    ),
                  ),
                  child: CupertinoTextFormFieldRow(
                    controller: _destinationController,
                    placeholder: 'Enter destination',
                    style: const TextStyle(
                      fontSize: 16,
                      color: CupertinoColors.label,
                      fontWeight: FontWeight.w500,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: const BoxDecoration(),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Destination is required';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Trip dates
              _buildSection(
                title: 'Trip dates',
                child: Container(
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemBackground,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.systemGrey.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    border: Border.all(
                      color: CupertinoColors.systemGrey5,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: _selectStartDate,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: CupertinoColors.systemGrey5,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Start date',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: CupertinoColors.label,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    _startDate != null 
                                        ? _formatDate(_startDate!)
                                        : 'Select date',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: _startDate != null 
                                          ? CupertinoColors.label
                                          : CupertinoColors.systemGrey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: CupertinoColors.systemGrey6,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(
                                      CupertinoIcons.calendar,
                                      color: CupertinoColors.systemGrey,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _selectEndDate,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'End date',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: CupertinoColors.label,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    _endDate != null 
                                        ? _formatDate(_endDate!)
                                        : 'Select date',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: _endDate != null 
                                          ? CupertinoColors.label
                                          : CupertinoColors.systemGrey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: CupertinoColors.systemGrey6,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(
                                      CupertinoIcons.calendar,
                                      color: CupertinoColors.systemGrey,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Description
              _buildSection(
                title: 'Description (optional)',
                child: Container(
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemBackground,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.systemGrey.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    border: Border.all(
                      color: CupertinoColors.systemGrey5,
                      width: 1,
                    ),
                  ),
                  child: CupertinoTextFormFieldRow(
                    controller: _descriptionController,
                    placeholder: 'Additional trip information',
                    style: const TextStyle(
                      fontSize: 16,
                      color: CupertinoColors.label,
                      fontWeight: FontWeight.w500,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: const BoxDecoration(),
                    maxLines: 3,
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Create button
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
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  onPressed: _isLoading ? null : _createTrip,
                  child: _isLoading 
                      ? const CupertinoActivityIndicator(color: CupertinoColors.white)
                      : const Text(
                          'Create Trip',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: CupertinoColors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required Widget child,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: CupertinoColors.label,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Color _getTemplateColor(String season) {
    switch (season) {
      case 'summer':
        return CupertinoColors.activeOrange;
      case 'winter':
        return CupertinoColors.activeBlue;
      case 'spring':
        return CupertinoColors.systemGreen;
      case 'autumn':
        return CupertinoColors.systemBrown;
      default:
        return CupertinoColors.systemGrey;
    }
  }

  IconData _getTemplateIcon(String name) {
    if (name.toLowerCase().contains('business') || name.toLowerCase().contains('деловая')) {
      return CupertinoIcons.briefcase;
    } else if (name.toLowerCase().contains('beach') || name.toLowerCase().contains('пляж')) {
      return CupertinoIcons.sun_max;
    } else if (name.toLowerCase().contains('ski') || name.toLowerCase().contains('лыж')) {
      return CupertinoIcons.snow;
    } else if (name.toLowerCase().contains('city') || name.toLowerCase().contains('туризм')) {
      return CupertinoIcons.building_2_fill;
    } else {
      return CupertinoIcons.airplane;
    }
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  void _selectStartDate() async {
    final date = await showCupertinoDatePicker(
      context: context,
      initialDateTime: _startDate ?? DateTime.now(),
      minimumDate: DateTime.now(),
      maximumDate: DateTime.now().add(const Duration(days: 365)),
    );
    
    if (date != null) {
      setState(() {
        _startDate = date;
        // Automatically set end date to one week later
        if (_endDate == null || _endDate!.isBefore(date)) {
          _endDate = date.add(const Duration(days: 7));
        }
      });
    }
  }

  void _selectEndDate() async {
    final date = await showCupertinoDatePicker(
      context: context,
      initialDateTime: _endDate ?? DateTime.now().add(const Duration(days: 7)),
      minimumDate: _startDate ?? DateTime.now(),
      maximumDate: DateTime.now().add(const Duration(days: 365)),
    );
    
    if (date != null) {
      setState(() {
        _endDate = date;
      });
    }
  }

  Future<void> _createTrip() async {
    if (!_formKey.currentState!.validate()) return;
    
    if (_startDate == null || _endDate == null) {
      _showErrorMessage('Select trip dates');
      return;
    }
    
    if (_endDate!.isBefore(_startDate!)) {
      _showErrorMessage('End date cannot be earlier than start date');
      return;
    }
    
    setState(() {
      _isLoading = true;
    });

    try {
      final databaseProvider = Provider.of<DatabaseProvider>(context, listen: false);
      
      // Create trip
      final tripData = TripsCompanion.insert(
        name: _nameController.text.trim(),
        destination: _destinationController.text.trim(),
        startDate: _startDate!,
        endDate: _endDate!,
        description: _descriptionController.text.trim().isEmpty 
            ? const drift.Value.absent() 
            : drift.Value(_descriptionController.text.trim()),
      );

      final tripId = await databaseProvider.database.insertTrip(tripData);
      
      // Create trip days
      await _createTripDays(tripId, _startDate!, _endDate!);
      
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

  Future<void> _createTripDays(int tripId, DateTime startDate, DateTime endDate) async {
    final databaseProvider = Provider.of<DatabaseProvider>(context, listen: false);
    
    final days = <DateTime>[];
    DateTime currentDate = startDate;
    
    while (!currentDate.isAfter(endDate)) {
      days.add(currentDate);
      currentDate = currentDate.add(const Duration(days: 1));
    }
    
    for (final day in days) {
      await databaseProvider.database.insertTripDay(
        TripDaysCompanion.insert(
          tripId: tripId,
          date: day,
        ),
      );
    }
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
}

Future<DateTime?> showCupertinoDatePicker({
  required BuildContext context,
  required DateTime initialDateTime,
  DateTime? minimumDate,
  DateTime? maximumDate,
}) async {
  // Ensure initialDateTime is not before minimumDate
  DateTime adjustedInitialDateTime = initialDateTime;
  if (minimumDate != null && initialDateTime.isBefore(minimumDate)) {
    adjustedInitialDateTime = minimumDate;
  }
  
  DateTime? selectedDate = adjustedInitialDateTime;
  
  await showCupertinoModalPopup<DateTime>(
    context: context,
    builder: (context) => Container(
      height: 300,
      color: CupertinoColors.systemBackground,
      child: Column(
        children: [
          Container(
            height: 50,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: CupertinoColors.separator,
                  width: 0.5,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                CupertinoButton(
                  child: const Text('Done'),
                  onPressed: () => Navigator.of(context).pop(selectedDate),
                ),
              ],
            ),
          ),
          Expanded(
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: adjustedInitialDateTime,
              minimumDate: minimumDate,
              maximumDate: maximumDate,
              onDateTimeChanged: (date) {
                selectedDate = date;
              },
            ),
          ),
        ],
      ),
    ),
  );
  
  return selectedDate;
}
