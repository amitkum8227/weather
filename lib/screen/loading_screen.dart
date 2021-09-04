import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';



class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }
  late double longitude;
  late double latitude;

  Future<void> getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
   longitude=location.longitude;
   latitude=location.latitude;
    NetworkHelper networkHelper=NetworkHelper(Uri.parse(

        'https://api.openweathermap.org/data/2.5/find?lat=$latitude&lon=$longitude&cnt=10&appid=6513a185e516bb6c79d470ec3c626b71');)


    var weatherData=await networkHelper.getData();





  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }


  }





