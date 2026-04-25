import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle displayLarge = TextStyle(
    fontSize: 72,
    fontWeight: FontWeight.w300,
    color: AppColors.textWhite,
    letterSpacing: 0.5,
  );
  
  static const TextStyle displaySmall = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    color: AppColors.textDimGrey,
    letterSpacing: 0.3,
  );
  
  static const TextStyle buttonNumber = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
    letterSpacing: 0.2,
  );
  
  static const TextStyle buttonFunction = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
    letterSpacing: 0.2,
  );
  
  static const TextStyle appBarTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textWhite,
    letterSpacing: 0.5,
  );
}