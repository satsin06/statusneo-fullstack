import 'package:flutter/material.dart';
import 'shimmer_box.dart';

class RecommendationShimmer extends StatelessWidget {
  const RecommendationShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ShimmerBox(height: 28, width: 200),
        SizedBox(height: 16),
        ShimmerBox(height: 100, width: double.infinity),
        SizedBox(height: 16),
        ShimmerBox(height: 80, width: double.infinity),
        SizedBox(height: 16),
        ShimmerBox(height: 120, width: double.infinity),
        SizedBox(height: 16),
        ShimmerBox(height: 120, width: double.infinity),
      ],
    );
  }
}