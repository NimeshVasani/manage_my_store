import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

class ImageChooser extends StatefulWidget {
  final ValueChanged<String> imagePath;

  const ImageChooser({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<ImageChooser> createState() => _ImageChooserState();
}

class _ImageChooserState extends State<ImageChooser> {
  int selectedImageIndex =
      -1; // Index of the selected image, -1 means none selected

  List<String> sampleImages = [
    'assets/web/chart1_img.png',
    'assets/web/chart2_img.png',
    'assets/web/web_back.jpg',
    // Add more image paths as needed
  ];

  Future<void> _openImagePicker() async {
    final pickedFile = await ImagePickerWeb.getImageAsBytes();

    if (pickedFile != null) {
      String base64Image = base64Encode(pickedFile);

      setState(() {
        // Reset selected image from the sample images
        selectedImageIndex = -1;
        widget.imagePath(base64Image);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            sampleImages.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedImageIndex = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selectedImageIndex == index
                        ? Colors.blue // Change border color for selected image
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Image.asset(
                  sampleImages[index],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "OR",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              // Add functionality to choose image from local file
              _openImagePicker();
            },
            child: const Text("Choose from local file"),
          ),
        ),
      ],
    );
  }
}
