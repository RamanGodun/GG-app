import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../data_management/theme_provider.dart';

class EditFormImage extends StatefulWidget {
  final String? currentProfileImage;
  final void Function(File? image) onImagePicked;
  final double? width;
  final double? height;

  const EditFormImage({
    super.key,
    required this.onImagePicked,
    required this.currentProfileImage,
    this.width,
    this.height,
  });

  @override
  State<EditFormImage> createState() => _EditFormImageState();
}

class _EditFormImageState extends State<EditFormImage> {
  File? _pickedImage;

  Future<String?> pickProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
      widget.onImagePicked(_pickedImage);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.height ?? 150,
      height: widget.height ?? 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: ColorsForApp.primary,
        ),
      ),
      child: _pickedImage == null
          ? widget.currentProfileImage == ''
              ? InkWell(
                  onTap: pickProfileImage,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Icon(
                      Icons.add_a_photo,
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                      size: 90,
                    ),
                  ),
                )
              : InkWell(
                  onTap: pickProfileImage,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      widget.currentProfileImage!.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
          : InkWell(
              onTap: pickProfileImage,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  _pickedImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
    );
  }
}




//TO USE IN ANOTHER WIDGET:


// File? _pickedImage;

//  void _handleImagePicked(File? image) {
//     _pickedImage = image;
//   }


//   EditFormImage(
//     onImagePicked: _handleImagePicked,
//     currentProfileImage: _currentProfileImage,
//   ),