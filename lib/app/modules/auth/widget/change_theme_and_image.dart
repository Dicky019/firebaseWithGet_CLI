import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeThemeAndImage extends StatelessWidget {
  const ChangeThemeAndImage({
    Key? key,
    required this.onPres,
    required this.asset,
    required this.back,
  }) : super(key: key);

  final VoidCallback onPres;
  final Widget back;
  final Widget asset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        asset,
        Positioned(
            top: 0,
            right: 0,
            child: Changebutton(
              onPres: onPres,
              iconLight: Icons.color_lens_outlined,
              iconDark: Icons.color_lens_rounded,
            )),
        back
      ],
    );
  }
}

class Changebutton extends StatelessWidget {
  const Changebutton({
    Key? key,
    required this.onPres,
    required this.iconLight,
    required this.iconDark,
  }) : super(key: key);

  final VoidCallback onPres;
  final IconData iconLight;
  final IconData iconDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            splashRadius: 20,
            onPressed: onPres,
            
            color: Colors.purple,
            icon: Icon(
              Get.isDarkMode ? iconLight : iconDark,
              color: Get.isDarkMode ? Colors.white70 : Colors.black87,
              size: 28,
            )),
      ],
    );
  }
}
