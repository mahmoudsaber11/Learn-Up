import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';

class ImagePickerAvatar extends StatelessWidget {
  const ImagePickerAvatar(
      {super.key,
      this.pickedImage,
      required this.onPick,
      this.isLarge = false});

  final bool? isLarge;
  final void Function(PlatformFile image) onPick;
  final PlatformFile? pickedImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isLarge! ? 300 : 100,
      width: isLarge! ? 300 : 100,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: pickedImage == null
                    ? null
                    : DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(
                          File(pickedImage!.path!),
                        ),
                      ),
                color:
                    pickedImage == null ? AppColors.backgroundFavorite : null,
              ),
            ),
          ),
          if (pickedImage == null)
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: SizedBox.expand(
                  child: IconButton(
                    onPressed: () async {
                      final result = await FilePicker.platform.pickFiles(
                        type: FileType.image,
                        withData: true,
                      );
                      if (result != null) {
                        onPick(result.files.first);
                      }
                    },
                    splashRadius: 50,
                    color: Theme.of(context).colorScheme.primary,
                    icon: Icon(
                      Icons.add_photo_alternate_outlined,
                      size: isLarge! ? 30 : 25.0,
                    ),
                  ),
                ),
              ),
            )
          else
            Positioned(
              bottom: 0,
              right: 0,
              height: 30,
              width: 30,
              child: Material(
                clipBehavior: Clip.hardEdge,
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(15),
                child: Center(
                  child: IconButton(
                    onPressed: () async {
                      final result = await FilePicker.platform.pickFiles(
                        type: FileType.image,
                        withData: true,
                      );
                      if (result != null) {
                        onPick(result.files.first);
                      }
                    },
                    iconSize: 15,
                    splashRadius: 30,
                    color: AppColors.scaffoldBackgroundColor,
                    icon: const Icon(
                      Icons.edit_outlined,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
