import "dart:ui";

import "package:flutter/material.dart";

class DogImportance extends StatelessWidget {
  const DogImportance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/rott3.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 500),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Importance of Dog',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '1)Dogs helps humans to navigate their  world ',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '2)Dogs provides unconditional love',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.start,
                ),
                Text(
                  '3)Dogs reduces stress and anxiety',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ));
  }
}
