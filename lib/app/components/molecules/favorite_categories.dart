import 'package:flutter/material.dart';

import '../atoms/custom_chip.dart';
import '../organisms/user_card.dart';

class FavoriteCategories extends StatelessWidget {
  const FavoriteCategories({
    super.key,
    required this.userCardData,
  });

  final UserCardData userCardData;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 4.0,
      spacing: 4.0,
      children: userCardData.categories.map(
        (item) {
          return CustomChip(
            chipTitle: item.categoryName,
            backgroundColor: item.categoryColor,
          );
        },
      ).toList(),
    );
  }
}
