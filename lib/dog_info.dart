import "package:flutter/material.dart";

class Doginfo extends StatelessWidget {
  const Doginfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/dog1.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              'Welcome to our page',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}
