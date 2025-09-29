import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart' hide CupertinoPageRoute;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:drift/drift.dart' as drift;
import '../../../../core/providers/database_provider.dart';
import '../../../../core/database/app_database.dart';

@RoutePage()
class AddEditOutfitPhotoScreen extends StatefulWidget {
  final OutfitPhoto? outfitPhoto;
  
  const AddEditOutfitPhotoScreen({
    super.key,
    this.outfitPhoto,
  });

  @override
  State<AddEditOutfitPhotoScreen> createState() => _AddEditOutfitPhotoScreenState();
}

class _AddEditOutfitPhotoScreenState extends State<AddEditOutfitPhotoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _tagsController = TextEditingController();
  
  Uint8List? _imageData;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeForm();
  }

  void _initializeForm() {
    if (widget.outfitPhoto != null) {
      _nameController.text = widget.outfitPhoto!.name;
      _descriptionController.text = widget.outfitPhoto!.description ?? '';
      _tagsController.text = widget.outfitPhoto!.tags ?? '';
      _imageData = widget.outfitPhoto!.imageData;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _tagsController.dispose();
    super.dispose();
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
        middle: Text(
          widget.outfitPhoto != null ? 'Edit Photo' : 'Add Photo',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.5,
          ),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: _isLoading ? null : _savePhoto,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: CupertinoColors.activeBlue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              widget.outfitPhoto != null ? 'Update' : 'Save',
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
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // Photo field
              _buildPhotoField(),
              const SizedBox(height: 24),
              
              // Name
              _buildFieldTitle('Outfit Name'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _nameController,
                placeholder: 'Enter outfit name',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter outfit name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              
              // Description
              _buildFieldTitle('Description (optional)'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _descriptionController,
                placeholder: 'Describe outfit',
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              
              // Tags
              _buildFieldTitle('Tags (optional)'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _tagsController,
                placeholder: 'Enter tags separated by commas',
              ),
              const SizedBox(height: 40),
              
              // Save button
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldTitle('Outfit Photo'),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: CupertinoColors.systemGrey4,
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
            child: _imageData != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.memory(
                      _imageData!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemGrey5,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          CupertinoIcons.camera,
                          color: CupertinoColors.systemGrey,
                          size: 28,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Tap to add photo',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: CupertinoColors.secondaryLabel,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Camera or gallery',
                        style: TextStyle(
                          fontSize: 14,
                          color: CupertinoColors.tertiaryLabel,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildFieldTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: CupertinoColors.label,
        letterSpacing: -0.3,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String placeholder,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Container(
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
        controller: controller,
        placeholder: placeholder,
        maxLines: maxLines,
        validator: validator,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: CupertinoColors.label,
        ),
        decoration: const BoxDecoration(),
      ),
    );
  }

  Widget _buildSaveButton() {
    return Container(
      width: double.infinity,
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
        onPressed: _isLoading ? null : _savePhoto,
        child: _isLoading
            ? const CupertinoActivityIndicator(
                color: CupertinoColors.white,
              )
            : Text(
                widget.outfitPhoto != null ? 'Update Photo' : 'Save Photo',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: CupertinoColors.white,
                  letterSpacing: -0.5,
                ),
              ),
      ),
    );
  }

  Future<void> _pickImage() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('Select Source'),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () async {
              Navigator.of(context).pop();
              await _getImage(ImageSource.camera);
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.camera, color: CupertinoColors.activeBlue),
                SizedBox(width: 8),
                Text('Camera'),
              ],
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              Navigator.of(context).pop();
              await _getImage(ImageSource.gallery);
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.photo, color: CupertinoColors.activeBlue),
                SizedBox(width: 8),
                Text('Gallery'),
              ],
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ),
    );
  }

  Future<void> _getImage(ImageSource source) async {
    try {
      final ImagePicker picker = ImagePicker();
      
      final XFile? image = await picker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
        requestFullMetadata: false,
      );

      if (image != null) {
        final bytes = await image.readAsBytes();
        if (bytes.isNotEmpty) {
          setState(() {
            _imageData = bytes;
          });
        } else {
          _showErrorMessage('Failed to load image');
        }
      }
    } catch (e) {
      print('Error selecting image: $e');
      if (e.toString().contains('Permission denied') || 
          e.toString().contains('permission') ||
          e.toString().contains('denied')) {
        _showErrorMessage('No permission to access camera/gallery. Check app settings.');
      } else if (e.toString().contains('Camera not available') ||
                 e.toString().contains('camera') ||
                 e.toString().contains('unavailable')) {
        _showErrorMessage('Camera not available on this device');
      } else {
        _showErrorMessage('Error selecting image: ${e.toString()}');
      }
    }
  }

  Future<void> _savePhoto() async {
    if (!_formKey.currentState!.validate()) return;
    
    if (_imageData == null) {
      _showErrorMessage('Select outfit photo');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final databaseProvider = Provider.of<DatabaseProvider>(context, listen: false);
      
      if (widget.outfitPhoto != null) {
        // Update existing photo
        await databaseProvider.database.updateOutfitPhoto(
          widget.outfitPhoto!.id,
          _nameController.text.trim(),
          _descriptionController.text.trim().isEmpty 
              ? null 
              : _descriptionController.text.trim(),
          _tagsController.text.trim().isEmpty 
              ? null 
              : _tagsController.text.trim(),
          _imageData!,
        );
      } else {
        // Create new photo
        await databaseProvider.database.insertOutfitPhoto(
          OutfitPhotosCompanion.insert(
            name: _nameController.text.trim(),
            description: _descriptionController.text.trim().isEmpty 
                ? const drift.Value.absent() 
                : drift.Value(_descriptionController.text.trim()),
            tags: _tagsController.text.trim().isEmpty 
                ? const drift.Value.absent() 
                : drift.Value(_tagsController.text.trim()),
            imageData: _imageData!,
            createdAt: drift.Value(DateTime.now()),
          ),
        );
      }
      
      if (mounted) {
        _showSuccessMessageAndClose(
          widget.outfitPhoto != null 
              ? 'Photo updated successfully!' 
              : 'Photo saved successfully!'
        );
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
              Navigator.of(context).pop(); // Close dialog
              Navigator.of(context).pop(true); // Close screen
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
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
