import 'package:projet_annuel/app/app_consts.dart';
import 'package:flutter/material.dart';

class AppButtonConnexion {
  
  static normalButton({
    required String title,
    VoidCallback? onPress,
    Color? backgroundColor = const Color.fromARGB(255, 24, 155, 179),
    Color? titleColor = const Color.fromARGB(255, 219, 221, 223),
    bool shadow = true,
    double height = 50,
    double width = double.infinity,
  }) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: shadow
              ? const [
                  BoxShadow(color: AppColors.lightGrey, blurRadius: 5),
                ]
              : null,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
