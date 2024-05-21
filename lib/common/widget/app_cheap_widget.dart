import 'package:aviasales_clone/common/common.dart';
import 'package:flutter/material.dart';

class AppCheapWidget extends StatelessWidget {
  const AppCheapWidget({
    super.key,
    required this.title,
    this.icon,
  });

  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: AppColors.grey3,
        ),
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon == null
                ? const SizedBox()
                : Row(
                    children: [
                      Icon(icon, size: 16.0),
                      const SizedBox(width: 8.0),
                    ],
                  ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14.0,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
