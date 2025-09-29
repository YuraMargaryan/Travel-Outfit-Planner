import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../core/providers/database_provider.dart';
import '../../../../core/database/app_database.dart';

@RoutePage()
class AddEditClothingScreen extends StatefulWidget {
  final ClothingItem? clothingItem;
  
  const AddEditClothingScreen({
    super.key,
    this.clothingItem,
  });

  @override
  State<AddEditClothingScreen> createState() => _AddEditClothingScreenState();
}

class _AddEditClothingScreenState extends State<AddEditClothingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _colorController = TextEditingController();
  final _sizeController = TextEditingController();
  final _brandController = TextEditingController();
  
  String _selectedCategory = 'top';
  bool _isLoading = false;

  final List<Map<String, String>> _categories = [
    {'value': 'top', 'label': 'Top'},
    {'value': 'bottom', 'label': 'Bottom'},
    {'value': 'shoes', 'label': 'Shoes'},
    {'value': 'accessories', 'label': 'Accessories'},
  ];

  @override
  void initState() {
    super.initState();
    if (widget.clothingItem != null) {
      _nameController.text = widget.clothingItem!.name;
      _colorController.text = widget.clothingItem!.color ?? '';
      _sizeController.text = widget.clothingItem!.size ?? '';
      _brandController.text = widget.clothingItem!.brand ?? '';
      _selectedCategory = widget.clothingItem!.category;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _colorController.dispose();
    _sizeController.dispose();
    _brandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          widget.clothingItem == null ? 'Add Clothing' : 'Edit Clothing',
          style: const TextStyle(
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
          onPressed: _isLoading ? null : _saveClothing,
          child: _isLoading 
              ? const CupertinoActivityIndicator()
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: CupertinoColors.activeBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    widget.clothingItem == null ? 'Save' : 'Update',
                    style: const TextStyle(
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
              // Name
              _buildSection(
                title: 'Name',
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
                    placeholder: 'Enter clothing item name',
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
              
              // Category
              _buildSection(
                title: 'Category',
                child: GestureDetector(
                  onTap: _showCategoryPicker,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _categories.firstWhere((c) => c['value'] == _selectedCategory)['label']!,
                          style: const TextStyle(
                            fontSize: 16,
                            color: CupertinoColors.label,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemGrey6,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            CupertinoIcons.chevron_right,
                            color: CupertinoColors.systemGrey,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              // Color
              _buildSection(
                title: 'Color (optional)',
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
                    controller: _colorController,
                    placeholder: 'e.g.: blue, red, black',
                    style: const TextStyle(
                      fontSize: 16,
                      color: CupertinoColors.label,
                      fontWeight: FontWeight.w500,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: const BoxDecoration(),
                  ),
                ),
              ),
              
              // Size
              _buildSection(
                title: 'Size (optional)',
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
                    controller: _sizeController,
                    placeholder: 'e.g.: M, L, 42, 10',
                    style: const TextStyle(
                      fontSize: 16,
                      color: CupertinoColors.label,
                      fontWeight: FontWeight.w500,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: const BoxDecoration(),
                  ),
                ),
              ),
              
              // Brand
              _buildSection(
                title: 'Brand (optional)',
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
                    controller: _brandController,
                    placeholder: 'e.g.: Nike, Adidas, Zara',
                    style: const TextStyle(
                      fontSize: 16,
                      color: CupertinoColors.label,
                      fontWeight: FontWeight.w500,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: const BoxDecoration(),
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
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

  void _showCategoryPicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('Select Category'),
        actions: _categories.map((category) {
          return CupertinoActionSheetAction(
            onPressed: () {
              setState(() {
                _selectedCategory = category['value']!;
              });
              Navigator.of(context).pop();
            },
            child: Text(category['label']!),
          );
        }).toList(),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ),
    );
  }

  Future<void> _saveClothing() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() {
      _isLoading = true;
    });

    try {
      final databaseProvider = Provider.of<DatabaseProvider>(context, listen: false);
      
      final clothingData = ClothingItemsCompanion.insert(
        name: _nameController.text.trim(),
        category: _selectedCategory,
        color: _colorController.text.trim().isEmpty 
            ? const drift.Value.absent() 
            : drift.Value(_colorController.text.trim()),
        size: _sizeController.text.trim().isEmpty 
            ? const drift.Value.absent() 
            : drift.Value(_sizeController.text.trim()),
        brand: _brandController.text.trim().isEmpty 
            ? const drift.Value.absent() 
            : drift.Value(_brandController.text.trim()),
      );

      if (widget.clothingItem == null) {
        // Adding new clothing
        await databaseProvider.database.insertClothingItem(clothingData);
        
        if (mounted) {
          Navigator.of(context).pop(true);
        }
      } else {
        // Updating existing clothing
        final updatedItem = widget.clothingItem!.copyWith(
          name: _nameController.text.trim(),
          category: _selectedCategory,
          color:  drift.Value(_colorController.text.trim().isEmpty ? null : _colorController.text.trim()) ,
          size:drift.Value(_sizeController.text.trim().isEmpty ? null : _sizeController.text.trim())  ,
          brand:drift.Value( _brandController.text.trim().isEmpty ? null : _brandController.text.trim()),
        );
        
        await databaseProvider.database.updateClothingItem(updatedItem);
        
        if (mounted) {
          Navigator.of(context).pop(true);
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
