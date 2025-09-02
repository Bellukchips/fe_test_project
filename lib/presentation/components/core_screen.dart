import 'package:fe_test_project/presentation/components/concentric_ring_painter.dart';
import 'package:fe_test_project/utils/color_assets.dart';
import 'package:flutter/material.dart';


class CoreScreen extends StatelessWidget {
  final Widget child;
  const CoreScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: ColorAssets.primaryColor,
          child: CustomPaint(
            painter: ConcentricRingsPainter(),
            child: child
          ),
        ),
    );
  }
}
