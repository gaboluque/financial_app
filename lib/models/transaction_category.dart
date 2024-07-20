import 'package:flutter/material.dart';

class TransactionCategory {
  static final categoriesData = {
    'Food': {
      'icon': Icons.fastfood,
      'color': Colors.orange, // Orange often represents food and appetite
    },
    'Transportation': {
      'icon': Icons.directions_bus,
      'color': Colors.blue, // Blue can symbolize movement and travel
    },
    'Health': {
      'icon': Icons.local_hospital,
      'color': Colors
          .red, // Red is often associated with health and emergency services
    },
    'Entertainment': {
      'icon': Icons.movie,
      'color': Colors.purple, // Purple can represent creativity and fun
    },
    'Education': {
      'icon': Icons.school,
      'color': Colors.green, // Green often symbolizes growth and learning
    },
    'Other': {
      'icon': Icons.category,
      'color': Colors.grey, // Grey for a neutral, miscellaneous category
    },
  };

  static get categories => categoriesData.keys.toList();

  static get defaultCategory => 'Other';

  static bool isValidCategory(String category) {
    return categories.contains(category);
  }

  static Color getColor(String category) {
    return categoriesData[category]!['color'] as Color;
  }

  static IconData getIcon(String category) {
    return categoriesData[category]!['icon'] as IconData;
  }
}
