import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../../core/providers/database_provider.dart';
import '../../../../core/database/app_database.dart';

@RoutePage()
class ClothingSelectionScreen extends StatefulWidget {
  final List<int> selectedClothingIds;
  
  const ClothingSelectionScreen({
    super.key,
    this.selectedClothingIds = const [],
  });

  @override
  State<ClothingSelectionScreen> createState() => _ClothingSelectionScreenState();
}

class _ClothingSelectionScreenState extends State<ClothingSelectionScreen> {
  late Set<int> _selectedClothingIds;

  @override
  void initState() {
    super.initState();
    _selectedClothingIds = Set.from(widget.selectedClothingIds);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'Cancel',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: CupertinoColors.activeBlue,
            ),
          ),
        ),
        middle: const Text(
          'Select Clothing',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.5,
          ),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: _confirmSelection,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: CupertinoColors.activeBlue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Done (${_selectedClothingIds.length})',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: CupertinoColors.white,
              ),
            ),
          ),
        ),
        backgroundColor: CupertinoColors.systemBackground,
      ),
      child: SafeArea(
        child: Consumer<DatabaseProvider>(
          builder: (context, databaseProvider, child) {
            if (!databaseProvider.isInitialized) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }

            return FutureBuilder<List<ClothingItem>>(
              future: databaseProvider.database.getAllClothingItems(),
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
                          'Error loading clothing',
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

                final clothingItems = snapshot.data ?? [];

                if (clothingItems.isEmpty) {
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
                              CupertinoIcons.bag,
                              size: 48,
                              color: CupertinoColors.activeBlue,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'No clothing items',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: CupertinoColors.label,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Add clothing items first',
                            style: TextStyle(
                              fontSize: 16,
                              color: CupertinoColors.secondaryLabel,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: clothingItems.length,
                  itemBuilder: (context, index) {
                    final item = clothingItems[index];
                    final isSelected = _selectedClothingIds.contains(item.id);
                    
                    return _buildClothingItemCard(item, isSelected);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildClothingItemCard(ClothingItem item, bool isSelected) {
    return GestureDetector(
      onTap: () => _toggleSelection(item.id),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: isSelected 
              ? CupertinoColors.activeBlue.withOpacity(0.1)
              : CupertinoColors.systemBackground,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.systemGrey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(
            color: isSelected 
                ? CupertinoColors.activeBlue
                : CupertinoColors.systemGrey5,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Selection indicator
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: isSelected 
                      ? CupertinoColors.activeBlue
                      : CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected 
                        ? CupertinoColors.activeBlue
                        : CupertinoColors.systemGrey4,
                    width: 2,
                  ),
                ),
                child: isSelected
                    ? const Icon(
                        CupertinoIcons.checkmark,
                        color: CupertinoColors.white,
                        size: 16,
                      )
                    : null,
              ),
              const SizedBox(width: 16),
              
              // Category icon
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      _getCategoryColor(item.category),
                      _getCategoryColor(item.category).withOpacity(0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  _getCategoryIcon(item.category),
                  color: CupertinoColors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              
              // Item details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: isSelected 
                            ? CupertinoColors.activeBlue
                            : CupertinoColors.label,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: _getCategoryColor(item.category).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        _getCategoryName(item.category),
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: _getCategoryColor(item.category),
                        ),
                      ),
                    ),
                    if (item.color != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        item.color!,
                        style: TextStyle(
                          fontSize: 13,
                          color: isSelected 
                              ? CupertinoColors.activeBlue.withOpacity(0.8)
                              : CupertinoColors.secondaryLabel,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleSelection(int clothingId) {
    setState(() {
      if (_selectedClothingIds.contains(clothingId)) {
        _selectedClothingIds.remove(clothingId);
      } else {
        _selectedClothingIds.add(clothingId);
      }
    });
  }

  void _confirmSelection() {
    Navigator.of(context).pop(_selectedClothingIds.toList());
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'top':
        return CupertinoColors.systemBlue;
      case 'bottom':
        return CupertinoColors.systemGreen;
      case 'shoes':
        return CupertinoColors.systemOrange;
      case 'accessories':
        return CupertinoColors.systemPurple;
      default:
        return CupertinoColors.systemGrey;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'top':
        return CupertinoIcons.square_stack_3d_up;
      case 'bottom':
        return CupertinoIcons.rectangle_stack;
      case 'shoes':
        return CupertinoIcons.circle;
      case 'accessories':
        return CupertinoIcons.bag;
      default:
        return CupertinoIcons.question_circle;
    }
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
        return 'Other';
    }
  }
}
