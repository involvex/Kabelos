import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:kabelos/controllers/wifi_direct_controller.dart';
import 'package:kabelos/l10n/app_localizations.dart';

class PhotoPickerTab extends StatefulWidget {
  final WiFiDirectController controller;

  const PhotoPickerTab({super.key, required this.controller});

  @override
  State<PhotoPickerTab> createState() => _PhotoPickerTabState();
}

class _PhotoPickerTabState extends State<PhotoPickerTab> {
  List<File> _selectedPhotos = [];

  Future<void> _selectPhotos() async {
    final status = await Permission.photos.request();
    if (!mounted) return;

    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.photoPickerPermissionPhotos,
          ),
        ),
      );
      return;
    }

    final picked = await ImagePicker().pickMultiImage();
    if (picked.isNotEmpty) {
      setState(() {
        _selectedPhotos = picked.map((x) => File(x.path)).toList();
      });
    }
  }

  void _sendPhotos() {
    if (_selectedPhotos.isEmpty) return;
    for (final photo in _selectedPhotos) {
      widget.controller.sendFile(photo.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.photoPickerTitle,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                l10n.photoPickerSubtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(
                    context,
                  ).textTheme.bodySmall?.color?.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton.icon(
            onPressed: _selectPhotos,
            icon: const Icon(Icons.photo_library),
            label: Text(l10n.photoPickerSelectPhotos),
          ),
        ),
        const SizedBox(height: 16),
        if (_selectedPhotos.isNotEmpty)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.photoPickerSelectedCount(_selectedPhotos.length),
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1,
                        ),
                    itemCount: _selectedPhotos.length + 1,
                    itemBuilder: (context, index) {
                      if (index == _selectedPhotos.length) {
                        return GestureDetector(
                          onTap: _selectPhotos,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                            ),
                            child: const Icon(Icons.add, size: 32),
                          ),
                        );
                      }
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          _selectedPhotos[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        else
          Expanded(
            child: Center(
              child: Text(
                l10n.photoPickerNoPhotosSelected,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.color?.withValues(alpha: 0.5),
                ),
              ),
            ),
          ),
        const SizedBox(height: 16),
        if (_selectedPhotos.isNotEmpty)
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: _sendPhotos,
              icon: const Icon(Icons.send),
              label: Text(l10n.photoPickerSend(_selectedPhotos.length)),
            ),
          ),
        const SizedBox(height: 16),
      ],
    );
  }
}
