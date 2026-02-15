import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // ===== DISPLAY =====
  static const displayLarge = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
    color: AppColors.primary,
  );

  static const displayMedium = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  // ===== HEADLINE =====
  static const headlineLarge = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  static const headlineMedium = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );

  // ===== TITLE =====
  static const titleLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  static const titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );

  // ===== BODY =====
  static const bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.primary,
  );

  static const bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.primary,
  );

  static const bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.mid,
  );

  // ===== TIMER =====
  static const timer = TextStyle(
    fontSize: 56,
    fontWeight: FontWeight.w700,
    letterSpacing: 1,
    color: AppColors.accentDark,
  );

  // ===== BUTTON =====
  static const buttonPrimary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: Colors.white,
  );

  static const buttonSecondary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );

  // ===== CAPTION =====
  static const caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.mid,
  );
}