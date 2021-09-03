import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var url=Uri.parse('https://api.openweathermap.org/data/2.5/find?lat=55.5&lon=37.5&cnt=10&appid=6513a185e516bb6c79d470ec3c626b71');
  Future<void> getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.longitude);
    print(location.latitude);
  }

  Future<void> getData  () async {
    http.Response response= await  http.get(url) ;
   if(response.statusCode==200){
     String data= response.body;
     print(data);

   }else{
     print(response.statusCode);
   }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
