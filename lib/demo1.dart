import "dart:ui";

import "package:flutter/material.dart";

class CardWithBlurredCorners extends StatelessWidget {
  final String textss;
  const CardWithBlurredCorners({
    super.key,
    required this.textss,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        image: DecorationImage(
          image: AssetImage(
              'assets/images/Cd-world.png'), // Replace with your image asset
          fit: BoxFit.fitHeight,
        ),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          child: Container(
            alignment: Alignment.topCenter,
            color: Colors.transparent,
            child: Text(
              'World-Wide Data:${textss}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
