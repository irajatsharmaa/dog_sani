import "package:flutter/material.dart";

class Dogquotes extends StatelessWidget {
  const Dogquotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      //backgroundColor: Colors.green,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/dog2.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(30),
          child: Text(
            'Dogs do "speak",\nbut only to those who know how to "listen"',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
