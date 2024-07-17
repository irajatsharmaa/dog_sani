import "dart:ui";

import "package:dogsanitize/demo1.dart";
import "package:dogsanitize/emergency.dart";
import "package:dogsanitize/formdemo.dart";
import "package:flutter/material.dart";

class Livepage extends StatefulWidget {
  const Livepage({super.key});

  @override
  State<Livepage> createState() => _LivepageState();
}

class _LivepageState extends State<Livepage> {
  final List<String> states = const [
    'All',
    'Uttar Pradesh',
    'Odisha',
    'Andhra Pradesh',
    'Gujarat',
    'Madhya Pradesh',
    'West Bengal',
    'Uttarakhand',
    'Maharashtra',
    'Rajasthan',
    'Tamil Nadu',
    'Kerala',
    'Haryana',
    'Delhi',
    'Himachal Pradesh',
    'Karnataka',
    'Bihar',
    'Assam',
    'Punjab',
    'Jammu and Kashmir',
    'Chattisgarh',
  ];

  final List<String> datas = const [
    '50000',
    '2000',
    '3000',
    '4000',
    '5000',
    '6000',
    '3000',
    '2000',
    '4000',
    '2300',
    '2000',
    '2500',
    '1000',
    '2000',
    '1500',
    '3200',
    '1500',
    '1000',
    '1500',
    '500',
    '2000',
  ];

  late String selectedState;
  late String selectedData;
  late String current = datas[0];
  late String state;
  @override
  void initState() {
    super.initState();
    selectedState = states[0];
    selectedData = datas[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            SizedBox(height: 50),
            CardWithBlurredCorners(textss: current),
            SizedBox(height: 15),
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: states.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final state = states[index];
                  final data = datas[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedState = state;
                          selectedData = data;
                        });
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 5),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Chip(
                              backgroundColor: selectedState == state
                                  ? Colors.green
                                  : const Color.fromRGBO(245, 247, 249, 1),
                              //backgroundColor: Colors.yellowAccent,
                              label: Text(
                                state,
                                style: TextStyle(color: Colors.black),
                              ),

                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 25),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.grey,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        //border: ,
                        image: DecorationImage(
                          image: (selectedState == 'All' ||
                                  selectedState == 'Odisha' ||
                                  selectedState == 'Delhi' ||
                                  selectedState == 'Gujarat' ||
                                  selectedState == 'Assam' ||
                                  selectedState == 'Bihar' ||
                                  selectedState == 'Haryana' ||
                                  selectedState == 'West Bengal')
                              ? AssetImage(
                                  'assets/images/3 black german shepherd.jpg')
                              : AssetImage('assets/images/rott2.jpg'),
                          fit: BoxFit.fill,
                        )),
                    padding: EdgeInsets.only(top: 65),
                    child: Text(
                      '#Dogs helped\n$selectedData',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    height: 220,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          ],
        ),
        //extendBody: true,
        bottomNavigationBar: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SafeArea(
            child: BottomAppBar(
                elevation: 0.0,
                color: Colors.black45,
                child: Container(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: ElevatedButton(
                                child: Row(
                                  children: [
                                    Icon(Icons.add_reaction),
                                    Text(
                                      'Self Request',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => demoform()));
                                },
                              ),
                            ),
                            ElevatedButton(
                              child: Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    Text('Emergency SOS'),
                                  ],
                                ),
                              ),

                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Emergency()));
                              },
                              // child: Text(
                              //   'Emergency SOS',
                              //   style: TextStyle(color: Colors.white),
                              // ),
                            ),
                          ],
                        )
                      ],
                    ))),
          ),
        ));
  }
}
