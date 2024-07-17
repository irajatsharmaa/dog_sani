import 'package:dogsanitize/live_page.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SimpleAnimation extends StatefulWidget {
  const SimpleAnimation({Key? key}) : super(key: key);

  @override
  State<SimpleAnimation> createState() => _SimpleAnimationState();
}

class _SimpleAnimationState extends State<SimpleAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: RiveAnimation.asset('assets/doggg.riv')),
        bottomNavigationBar: Theme(
            data: Theme.of(context),
            child: BottomAppBar(
                elevation: 0.0,
                color: Colors.black,
                child: Container(
                    //margin: EdgeInsets.only(bottom: 50),
                    height: 500,
                    padding: EdgeInsets.only(bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Livepage()));
                          },
                          child: Text(
                            'GET\'S STARTED ',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )))));
  }
}
//Icon(Icons.pets, color: Colors.white, size: 60),