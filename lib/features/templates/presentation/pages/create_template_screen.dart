import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../core/providers/database_provider.dart';
import '../../../../core/database/app_database.dart';

@RoutePage()
class CreateTemplateScreen extends StatefulWidget {
  final TripTemplate? template;
  
  const CreateTemplateScreen({
    super.key,
    this.template,
  });

  @override
  State<CreateTemplateScreen> createState() => _CreateTemplateScreenState();
}

class _CreateTemplateScreenState extends State<CreateTemplateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _destinationController = TextEditingController();
  
  String _selectedSeason = 'all';
  String _selectedDuration = 'week';
  bool _isLoading = false;

  final List<Map<String, String>> _seasons = [
    {'value': 'all', 'label': 'All Seasons'},
    {'value': 'spring', 'label': 'Spring'},
    {'value': 'summer', 'label': 'Summer'},
    {'value': 'autumn', 'label': 'Autumn'},
    {'value': 'winter', 'label': 'Winter'},
  ];

  final List<Map<String, String>> _durations = [
    {'value': 'weekend', 'label': 'Weekend (2-3 days)'},
    {'value': 'week', 'label': 'Week (7 days)'},
    {'value': 'month', 'label': 'Month (30 days)'},
  ];

  @override
  void initState() {
    super.initState();
    if (widget.template != null) {
      _nameController.text = widget.template!.name;
      _descriptionController.text = widget.template!.description ?? '';
      _destinationController.text = widget.template!.destination ?? '';
      _selectedSeason = widget.template!.season ?? 'all';
      _selectedDuration = widget.template!.duration ?? 'week';
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.template == null ? 'Create Template' : 'Edit Template'),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: _isLoading ? null : _createTemplate,
          child: _isLoading 
              ? const CupertinoActivityIndicator()
              : Text(widget.template == null ? 'Create' : 'Save'),
        ),
      ),
      child: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Template name
              _buildSection(
                title: 'Template Name',
                child: CupertinoTextFormFieldRow(
                  controller: _nameController,
                  placeholder: 'e.g.: Romantic vacation',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Description
              _buildSection(
                title: 'Description',
                child: CupertinoTextFormFieldRow(
                  controller: _descriptionController,
                  placeholder: 'Brief template description',
                  maxLines: 3,
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Destination
              _buildSection(
                title: 'Typical Destination',
                child: CupertinoTextFormFieldRow(
                  controller: _destinationController,
                  placeholder: 'e.g.: Paris, Moscow, Sochi',
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Season
              _buildSection(
                title: 'Season',
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: _showSeasonPicker,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _seasons.firstWhere((s) => s['value'] == _selectedSeason)['label']!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: CupertinoColors.label,
                        ),
                      ),
                      const Icon(
                        CupertinoIcons.chevron_right,
                        color: CupertinoColors.systemGrey,
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Duration
              _buildSection(
                title: 'Duration',
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: _showDurationPicker,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _durations.firstWhere((d) => d['value'] == _selectedDuration)['label']!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: CupertinoColors.label,
                        ),
                      ),
                      const Icon(
                        CupertinoIcons.chevron_right,
                        color: CupertinoColors.systemGrey,
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Information card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: CupertinoColors.systemBlue.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          CupertinoIcons.info_circle,
                          color: CupertinoColors.systemBlue,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Information',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: CupertinoColors.systemBlue,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'After creating the template, you can use it for quick trip creation. The template can be supplemented with a list of recommended clothing.',
                      style: TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.label,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Create button
              CupertinoButton.filled(
                onPressed: _isLoading ? null : _createTemplate,
                child: _isLoading 
                    ? const CupertinoActivityIndicator()
                    : Text(widget.template == null ? 'Create Template' : 'Save Changes'),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: CupertinoColors.label,
          ),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }

  void _showSeasonPicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('Select Season'),
        actions: _seasons.map((season) {
          return CupertinoActionSheetAction(
            onPressed: () {
              setState(() {
                _selectedSeason = season['value']!;
              });
              Navigator.of(context).pop();
            },
            child: Text(season['label']!),
          );
        }).toList(),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ),
    );
  }

  void _showDurationPicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('Select Duration'),
        actions: _durations.map((duration) {
          return CupertinoActionSheetAction(
            onPressed: () {
              setState(() {
                _selectedDuration = duration['value']!;
              });
              Navigator.of(context).pop();
            },
            child: Text(duration['label']!),
          );
        }).toList(),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ),
    );
  }

  Future<void> _createTemplate() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() {
      _isLoading = true;
    });

    try {
      final databaseProvider = Provider.of<DatabaseProvider>(context, listen: false);
      
      if (widget.template == null) {
        // Creating new template
        final templateData = TripTemplatesCompanion.insert(
          name: _nameController.text.trim(),
          description: _descriptionController.text.trim().isEmpty 
              ? const drift.Value.absent() 
              : drift.Value(_descriptionController.text.trim()),
          destination: _destinationController.text.trim().isEmpty 
              ? const drift.Value.absent() 
              : drift.Value(_destinationController.text.trim()),
          season: drift.Value(_selectedSeason),
          duration: drift.Value(_selectedDuration),
        );

        await databaseProvider.database.insertTemplate(templateData);
        
        if (mounted) {
          Navigator.of(context).pop(true); // Return true to refresh list
          _showSuccessMessage('Template created successfully!');
        }
      } else {
        // Updating existing template
        final updatedTemplate = widget.template!.copyWith(
          name: _nameController.text.trim(),
          description: drift.Value(_descriptionController.text.trim().isEmpty ? null : _descriptionController.text.trim()),
          destination: drift.Value(_destinationController.text.trim().isEmpty ? null : _destinationController.text.trim()),
          season: drift.Value(_selectedSeason),
          duration: drift.Value(_selectedDuration),
        );

        await databaseProvider.database.updateTemplate(updatedTemplate);
        
        if (mounted) {
          Navigator.of(context).pop(true); // Return true to refresh list
          _showSuccessMessage('Template updated successfully!');
        }
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
}
