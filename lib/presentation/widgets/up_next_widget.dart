import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class UpNextWidget extends StatelessWidget {
  const UpNextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Up next",
          style: TextStyle(
            fontSize: 14,
            color: AppColors.mid,
          ),
        ),
        SizedBox(height: 4),
        Text(
          "05:00",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
        SizedBox(height: 4),
        Text(
          "Short break",
          style: TextStyle(
            fontSize: 14,
            color: AppColors.mid,
          ),
        ),
      ],
    );
  }
}
