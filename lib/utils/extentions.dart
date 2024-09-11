import 'package:astrologer_app/constants/colorConst.dart';
import 'package:flutter/material.dart';

extension GradientBoxDecoration on BoxDecoration {
  static BoxDecoration customGradient() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.2, 0.5, 0.8, 0.9],
        colors: [
          COLORS.gradient1,
          COLORS.gradient2,
          COLORS.gradient3,
          COLORS.gradient4,
        ],
      ),
    );
  }
}
