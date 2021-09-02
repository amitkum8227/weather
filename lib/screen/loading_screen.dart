
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  Future<void> getLocation() async {
    Location location=Location();
    await location.getCurrentLocation();
    print(location.longitude);
    print (location.latitude);

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


    );
  }
}
