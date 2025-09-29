import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart' hide CupertinoPageRoute;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/providers/database_provider.dart';
import '../../../../core/database/app_database.dart';
import 'add_edit_outfit_photo_screen.dart';

@RoutePage()
class OutfitPhotosScreen extends StatefulWidget {
  const OutfitPhotosScreen({super.key});

  @override
  State<OutfitPhotosScreen> createState() => _OutfitPhotosScreenState();
}

class _OutfitPhotosScreenState extends State<OutfitPhotosScreen> with TickerProviderStateMixin {
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
          'Outfit Photos',
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
                // Header with add button
                AnimatedBuilder(
                  animation: _scaleAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              CupertinoColors.systemPurple.withOpacity(0.1),
                              CupertinoColors.systemPurple.withOpacity(0.05),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: CupertinoColors.systemPurple.withOpacity(0.1),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                          border: Border.all(
                            color: CupertinoColors.systemPurple.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: CupertinoColors.systemPurple,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: const Icon(
                                          CupertinoIcons.camera,
                                          color: CupertinoColors.white,
                                          size: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      const Expanded(
                                        child: Text(
                                          'Outfit Photos',
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800,
                                            color: CupertinoColors.label,
                                            letterSpacing: -0.8,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Consumer<DatabaseProvider>(
                                    builder: (context, databaseProvider, child) {
                                      return FutureBuilder<List<OutfitPhoto>>(
                                        future: databaseProvider.database.getAllOutfitPhotos(),
                                        builder: (context, snapshot) {
                                          final count = snapshot.data?.length ?? 0;
                                          return Text(
                                            'Total photos: $count',
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: CupertinoColors.secondaryLabel,
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
                            const SizedBox(width: 12),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    CupertinoColors.systemPurple,
                                    CupertinoColors.systemPurple.withOpacity(0.8),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: CupertinoColors.systemPurple.withOpacity(0.4),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: CupertinoButton(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                onPressed: _addOutfitPhoto,
                                child: const Text(
                                  'Add',
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
                    );
                  },
                ),
                
                // Photo list
                Expanded(
                  child: Consumer<DatabaseProvider>(
                    builder: (context, databaseProvider, child) {
                      if (!databaseProvider.isInitialized) {
                        return const Center(
                          child: CupertinoActivityIndicator(),
                        );
                      }

                      return FutureBuilder<List<OutfitPhoto>>(
                        future: databaseProvider.database.getAllOutfitPhotos(),
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

                          final photos = snapshot.data ?? [];

                          if (photos.isEmpty) {
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
                                            CupertinoColors.systemPurple.withOpacity(0.1),
                                            CupertinoColors.systemPurple.withOpacity(0.05),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(60),
                                      ),
                                      child: const Icon(
                                        CupertinoIcons.camera,
                                        size: 48,
                                        color: CupertinoColors.systemPurple,
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    const Text(
                                      'No saved photos',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: CupertinoColors.label,
                                        letterSpacing: -0.5,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Add photos of your outfits',
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
                                        color: CupertinoColors.systemPurple,
                                        borderRadius: BorderRadius.circular(16),
                                        boxShadow: [
                                          BoxShadow(
                                            color: CupertinoColors.systemPurple.withOpacity(0.3),
                                            blurRadius: 12,
                                            offset: const Offset(0, 6),
                                          ),
                                        ],
                                      ),
                                      child: CupertinoButton(
                                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                                        onPressed: _addOutfitPhoto,
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
                                              'Add Photo',
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

                          return ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            itemCount: photos.length,
                            itemBuilder: (context, index) {
                              final photo = photos[index];
                              return _buildPhotoCard(photo, index, photos);
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

  Widget _buildPhotoCard(OutfitPhoto photo, int index, List<OutfitPhoto> allPhotos) {
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
                        // Photo preview
                        Hero(
                          tag: 'outfit_photo_${photo.id}',
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: CupertinoColors.systemGrey.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                        child: Image.memory(
                          photo.imageData,
                          fit: BoxFit.cover,
                          width: 80,
                          height: 80,
                        ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                photo.name,
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
                                  color: CupertinoColors.systemPurple.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: CupertinoColors.systemPurple.withOpacity(0.3),
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  'Outfit',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: CupertinoColors.systemPurple,
                                  ),
                                ),
                              ),
                              if (photo.description != null) ...[
                                const SizedBox(height: 12),
                                Text(
                                  photo.description!,
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
                                onPressed: () => _viewPhoto(photo, allPhotos),
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
                                onPressed: () => _deletePhoto(photo),
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
                    // Clothing items
                    FutureBuilder<List<ClothingItem>>(
                      future: _getClothingItemsForPhoto(photo.id),
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              const Text(
                                'Clothing Items:',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: CupertinoColors.label,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: snapshot.data!.map((item) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _getCategoryColor(item.category).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: _getCategoryColor(item.category).withOpacity(0.3),
                                        width: 1,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          _getCategoryIcon(item.category),
                                          size: 14,
                                          color: _getCategoryColor(item.category),
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          item.name,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: _getCategoryColor(item.category),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                    
                    if (photo.tags != null && photo.tags!.isNotEmpty) ...[
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: photo.tags!.split(',').map((tag) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
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
                              tag.trim(),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: CupertinoColors.secondaryLabel,
                              ),
                            ),
                          );
                        }).toList(),
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

  void _addOutfitPhoto() {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => const AddEditOutfitPhotoScreen(),
      ),
    ).then((_) {
      setState(() {});
    });
  }

  void _viewPhoto(OutfitPhoto photo, List<OutfitPhoto> allPhotos) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => _FullScreenPhotoViewer(
          photo: photo,
          allPhotos: allPhotos,
        ),
      ),
    );
  }

  void _deletePhoto(OutfitPhoto photo) async {
    final confirmed = await showCupertinoDialog<bool>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Delete Photo'),
        content: Text('Are you sure you want to delete photo "${photo.name}"?'),
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
      await databaseProvider.database.deleteOutfitPhoto(photo.id);
      
      if (mounted) {
        setState(() {});
        _showSuccessMessage('Photo deleted');
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

  Future<List<ClothingItem>> _getClothingItemsForPhoto(int photoId) async {
    final databaseProvider = Provider.of<DatabaseProvider>(context, listen: false);
    return await databaseProvider.database.getClothingItemsForOutfit(photoId);
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
}

// Full-screen photo viewer with scrolling
class _FullScreenPhotoViewer extends StatefulWidget {
  final OutfitPhoto photo;
  final List<OutfitPhoto> allPhotos;

  const _FullScreenPhotoViewer({
    required this.photo,
    required this.allPhotos,
  });

  @override
  State<_FullScreenPhotoViewer> createState() => _FullScreenPhotoViewerState();
}

class _FullScreenPhotoViewerState extends State<_FullScreenPhotoViewer> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.allPhotos.indexWhere((p) => p.id == widget.photo.id);
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.black.withOpacity(0.8),
        middle: Text(
          widget.allPhotos[_currentIndex].name,
          style: const TextStyle(
            color: CupertinoColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.of(context).pop(),
          child: const Icon(
            CupertinoIcons.xmark,
            color: CupertinoColors.white,
            size: 24,
          ),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => _showPhotoInfo(context),
          child: const Icon(
            CupertinoIcons.info_circle,
            color: CupertinoColors.white,
            size: 24,
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Position indicator
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${_currentIndex + 1} of ${widget.allPhotos.length}',
                    style: const TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            
            // PageView for scrolling between photos
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: widget.allPhotos.length,
                itemBuilder: (context, index) {
                  final photo = widget.allPhotos[index];
                  return Center(
                    child: InteractiveViewer(
                      minScale: 0.5,
                      maxScale: 3.0,
                      child: Hero(
                        tag: 'outfit_photo_${photo.id}',
                        child: Image.memory(
                          photo.imageData,
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPhotoInfo(BuildContext context) {
    final currentPhoto = widget.allPhotos[_currentIndex];
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: Text(currentPhoto.name),
        message: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (currentPhoto.description != null && currentPhoto.description!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                currentPhoto.description!,
                style: const TextStyle(
                  fontSize: 16,
                  color: CupertinoColors.secondaryLabel,
                ),
              ),
            ],
            if (currentPhoto.tags != null && currentPhoto.tags!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                'Tags: ${currentPhoto.tags}',
                style: const TextStyle(
                  fontSize: 14,
                  color: CupertinoColors.tertiaryLabel,
                ),
              ),
            ],
            const SizedBox(height: 8),
            Text(
              'Size: ${(currentPhoto.imageData.length / 1024).toStringAsFixed(1)} KB',
              style: const TextStyle(
                fontSize: 12,
                color: CupertinoColors.tertiaryLabel,
              ),
            ),
            Text(
              'Created: ${_formatDate(currentPhoto.createdAt)}',
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

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
  }
}
