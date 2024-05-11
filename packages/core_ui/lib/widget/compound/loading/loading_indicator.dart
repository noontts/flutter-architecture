import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
      width: 80,
      height: 80,
      child: LoadingIndicator(
        indicatorType: Indicator.ballScaleRippleMultiple,
        strokeWidth: 2,
        colors: [Colors.blue],
      ),
    ));
  }
}
