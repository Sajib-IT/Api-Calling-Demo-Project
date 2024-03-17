import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DummyApiShimmer extends StatelessWidget {
  final bool isProductApi;
  const DummyApiShimmer({super.key, this.isProductApi = false});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          itemBuilder: (context, index) => Container(
                height: isProductApi?300:140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
              ),
          separatorBuilder: (context, index) => SizedBox(
                height: 32,
              ),
          itemCount: 5),
    );
    ;
  }
}
