import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeThemeAndImage extends StatelessWidget {
  const ChangeThemeAndImage({
    Key? key,
    required this.onPres,
    required this.asset,
  }) : super(key: key);

  final VoidCallback onPres;
  final Widget asset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        asset,
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
              splashRadius: 20,
              onPressed: onPres,
              icon: Icon(
                Get.isDarkMode
                    ? Icons.color_lens_outlined
                    : Icons.color_lens_rounded,
                color: Get.isDarkMode ? Colors.white70 : Colors.black87,
              )),
        ),
      ],
    );
  }
}