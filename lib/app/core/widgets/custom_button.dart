import 'package:baby_tracker_app/app/core/constants/mediaquery_constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Text text;
  final Function() onPressed;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff4625c3),
                fixedSize: Size(displayHeight(context) / 2.5, displayWidth(context) / 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
            onPressed: onPressed,
            child: text),
      ),
    );
  }
}
