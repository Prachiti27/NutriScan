import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class ImageCard extends StatelessWidget {
  final XFile? image;
  final File? mobileImage;
  final VoidCallback? onTap;

  const ImageCard({
    this.image,
    this.mobileImage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final hasImage = image != null;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 220,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: hasImage
                ? Colors.transparent
                : Colors.grey.shade300,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black.withOpacity(0.04),
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: hasImage
            ? ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: kIsWeb
                          ? Image.network(
                              image!.path,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              mobileImage!,
                              fit: BoxFit.cover,
                            ),
                    ),

                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              )

            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.08),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 32,
                      color: Colors.grey[500],
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    "Upload food label",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "Tap to select image",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}