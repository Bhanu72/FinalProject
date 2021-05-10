import 'package:http/http.dart';
import 'dart:convert';

class WeatherModel {
  double temp;
  double pressure;
  double tempmax;
  double tempmin;
  String weatherstatus;
  double windspeed;
  String mainweather;
  var Url = '5463b9018e5dd0629339595e98813ad6';
  WeatherModel(
      {this.temp,
      this.tempmax,
      this.tempmin,
      this.pressure,
      this.weatherstatus,
      this.windspeed,
      this.mainweather});

  Future<void> getData(String city) async {
    try {
      Response res = await get(Uri.parse(
          'http://api.openweathermap.org/data/2.5/weather?q=$city&APPID=$Url'));
      Map data = jsonDecode(res.body);
      Map mainData = data['main'];
      List weather = data['weather'];
      weatherstatus = weather[0]['description'];
      mainweather = weather[0]['main'];
      print(weatherstatus);
      Map wind = data['wind'];
      print(wind);
      windspeed = wind['speed'];
      print(windspeed.toString());
      print(weather);
      temp = mainData['temp'] - 272.5;
      tempmax = mainData['temp_max'] - 272.5;
      tempmin = mainData['temp_min'] - 272.5;
    } catch (e) {
      print('error: $e');
    }
  }
}
