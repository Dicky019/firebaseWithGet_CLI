import 'package:flutter/material.dart';

class SosialMediaButton extends StatelessWidget {
  const SosialMediaButton({
    Key? key,
    required this.onPres,
    required this.sosialMedia, required this.label, required this.color,
  }) : super(key: key);

  final VoidCallback onPres;
  final Widget sosialMedia;
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          // padding: EdgeInsets.symmetric(vertical: 14),
        ),
        icon: sosialMedia,
        label: Text(label),
        onPressed: onPres,
      ),
    );
  }
}