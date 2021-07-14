import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        child: Container(
          width: 20.65,
          child: CircularProgressIndicator(
            // color: Colors.white,
            strokeWidth: 3,
          ),
        ),
        onPressed: null,
      ),
    );
  }
}