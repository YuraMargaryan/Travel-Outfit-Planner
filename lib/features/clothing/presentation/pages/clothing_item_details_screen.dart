import 'package:auto_route/auto_route.dart' hide CupertinoPageRoute;
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../../core/providers/database_provider.dart';
import '../../../../core/database/app_database.dart';
import 'add_edit_clothing_screen.dart';

@RoutePage()
class ClothingItemDetailsScreen extends StatefulWidget {
  final ClothingItem clothingItem;
  
  const ClothingItemDetailsScreen({
    super.key,
    required this.clothingItem,
  });

  @override
  State<ClothingItemDetailsScreen> createState() => _ClothingItemDetailsScreenState();
}

class _ClothingItemDetailsScreenState extends State<ClothingItemDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.clothingItem.name),
        backgroundColor: CupertinoColors.systemBackground,
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: _showOptions,
          child: const Icon(
            CupertinoIcons.ellipsis,
            color: CupertinoColors.systemGrey,
          ),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main information
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    // Icon
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: _getCategoryColor(widget.clothingItem.category),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        _getCategoryIcon(widget.clothingItem.category),
                        color: CupertinoColors.white,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Name
                    Text(
                      widget.clothingItem.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.label,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    
                    // Category
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: _getCategoryColor(widget.clothingItem.category).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _getCategoryName(widget.clothingItem.category),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: _getCategoryColor(widget.clothingItem.category),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Detailed information
              const Text(
                'Detailed Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.label,
                ),
              ),
              const SizedBox(height: 16),
              
              _buildInfoCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildInfoRow('Category', _getCategoryName(widget.clothingItem.category)),
          if (widget.clothingItem.color != null)
            _buildInfoRow('Color', widget.clothingItem.color!),
          if (widget.clothingItem.size != null)
            _buildInfoRow('Size', widget.clothingItem.size!),
          if (widget.clothingItem.brand != null)
            _buildInfoRow('Brand', widget.clothingItem.brand!),
          _buildInfoRow('Date Added', _formatDate(widget.clothingItem.createdAt)),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: CupertinoColors.secondaryLabel,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: CupertinoColors.label,
              ),
            ),
          ),
        ],
      ),
    );
  }


  String _getCategoryName(String category) {
    switch (category) {
      case 'top':
        return 'Top';
      case 'bottom':
        return 'Bottom';
      case 'shoes':
        return 'Shoes';
      case 'accessories':
        return 'Accessories';
      default:
        return category;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'top':
        return CupertinoColors.activeBlue;
      case 'bottom':
        return CupertinoColors.activeGreen;
      case 'shoes':
        return CupertinoColors.systemBrown;
      case 'accessories':
        return CupertinoColors.activeOrange;
      default:
        return CupertinoColors.systemGrey;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'top':
        return CupertinoIcons.rectangle_stack;
      case 'bottom':
        return CupertinoIcons.rectangle_stack;
      case 'shoes':
        return CupertinoIcons.circle;
      case 'accessories':
        return CupertinoIcons.star;
      default:
        return CupertinoIcons.bag;
    }
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  void _showOptions() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: Text(widget.clothingItem.name),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop();
              _editItem();
            },
            child: const Text('Edit'),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(context).pop();
              _deleteItem();
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

  void _editItem() async {
    final result = await Navigator.of(context).push<bool>(
      CupertinoPageRoute(
        builder: (context) => AddEditClothingScreen(clothingItem: widget.clothingItem),
      ),
    );
    
    if (result == true) {
      Navigator.of(context).pop(true); // Return and refresh list
    }
  }

  void _deleteItem() async {
    final confirmed = await showCupertinoDialog<bool>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Delete Item'),
        content: Text('Are you sure you want to delete "${widget.clothingItem.name}"?'),
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
      await databaseProvider.database.deleteClothingItem(widget.clothingItem.id);
      
      if (mounted) {
        Navigator.of(context).pop(true); // Return and refresh list
        _showSuccessMessage('Clothing item deleted');
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
}
