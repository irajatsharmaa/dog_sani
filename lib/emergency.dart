import "dart:developer";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:geolocator/geolocator.dart";

class Emergency extends StatefulWidget {
  const Emergency({super.key});

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  late String latitude;
  late String longitude;
  late String timestamp;
  @override
  void initState() {
    latitude = '0';
    longitude = '0';
    timestamp = '0.0';
    super.initState();
  }

  void submitform() {
    CollectionReference collex =
        FirebaseFirestore.instance.collection('EmergencySOS');
    collex.add({
      'Longitude': longitude,
      'Latitude': latitude,
      'Timestamp': DateTime.now(),
    });
    final snackbar = SnackBar(
      content: Text(
        'Location Sent Successfully',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.black,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  _determinePosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      log("Location Denied");
      LocationPermission ask = await Geolocator.requestPermission();
    } else {
      Position currentposition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      log("Latitude=${currentposition.latitude.toString()}");
      log("Longitude=${currentposition.longitude.toString()}");
      log("Timestamp=${currentposition.timestamp.toString()}");
      //log(DateTime.now().toString());
      setState(() {
        latitude = currentposition.latitude.toString();
        longitude = currentposition.longitude.toString();
        timestamp = currentposition.timestamp.toString();
      });
      submitform();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 100.0,
        backgroundColor: Colors.green,
        title: Text(
          'LOCATION',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 250),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              "Longitude: $longitude \nLatitude: $latitude",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  _determinePosition();
                  //submitform();
                },
                child: Container(
                  width: 200,
                  padding: EdgeInsets.only(left: 32),
                  child: Row(
                    children: [
                      Icon(Icons.location_on_rounded),
                      Text(
                        'SEND LOCATION',
                      ),
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ))
          ],
        ),
      ),
    );
  }
}
