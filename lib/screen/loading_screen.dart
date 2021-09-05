import 'package:flutter/material.dart';

import 'package:weather/screen/location_screen.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const appKey='6513a185e516bb6c79d470ec3c626b71';

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


  Future<void> getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper=NetworkHelper(Uri.parse(

        'https://api.openweathermap.org/data/2.5/find?lat=${location.latitude}&lon=${location.longitude}&cnt=10&appid=$appKey&units=metric'));


    var weatherData=await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData);
    }));




  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SpinKitDoubleBounce(
        color: Colors.white,
      ),),
    );
  }


  }





