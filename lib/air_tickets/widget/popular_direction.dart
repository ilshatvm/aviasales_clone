import 'package:aviasales_clone/common/common.dart';
import 'package:flutter/material.dart';

class PopularDirectionModel {
  final String name;
  final String imagePath;

  PopularDirectionModel({required this.name, required this.imagePath});
}

class PopularDirection extends StatelessWidget {
  const PopularDirection({
    super.key,
    required this.name,
    required this.imagePath,
  });

  final String name;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  'Популярное направление',
                  style: TextStyle(color: AppColors.grey5),
                ),
              ],
            )
          ],
        ),
        const Divider(
          height: 1.0,
          color: AppColors.grey4,
        ),
      ],
    );
  }
}
