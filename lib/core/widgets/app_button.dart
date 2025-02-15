import 'package:flutter/material.dart';
import 'package:marketi/core/constants/colors.dart';

class AppButton extends StatelessWidget {
  final String btnText;
  final void Function()? onPress;
  const AppButton({super.key, required this.btnText, this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: onPress,
        child: Text(
          btnText,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ));
  }
}
