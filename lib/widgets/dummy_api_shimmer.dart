import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DummyApiShimmer extends StatelessWidget {
  const DummyApiShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: ListView.separated(
          itemBuilder: (context, index) =>Container(
            padding: EdgeInsets.symmetric(vertical: 12,horizontal: 2),
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(
                height: 15,
              ),
          itemCount: 5),
    );
    ;
  }
}
