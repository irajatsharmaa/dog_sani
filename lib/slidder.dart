import 'package:dogsanitize/index.dart';
import "package:flutter/material.dart";
import 'package:dogsanitize/dog_importance.dart';
import 'package:dogsanitize/dog_info.dart';
import 'package:dogsanitize/dog_quotes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class slidder extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              Doginfo(),
              Dogquotes(),
              DogImportance(),

              SimpleAnimation(),
              // Add more pages as needed
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 4, // Number of pages
                  effect: CustomizableEffect(
                      dotDecoration: DotDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(3),
                        width: 10,
                        height: 10,
                      ),
                      spacing: 20,
                      activeDotDecoration: DotDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(3),
                        width: 10,
                        height: 10,
                      ))),
            ),
          ),
        ],
      ),
    );
  }
}
