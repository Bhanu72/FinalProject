import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/weather/model.dart';
import 'package:solar_system/weather/bloc.dart';

class Weather extends StatefulWidget {
  Weather({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  int color1 = _getColorFromHex("#192A56");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(color1),
        body: BlocProvider(
            create: (context) => WeatherBloc(WeatherModel()),
            child: SearchPage()));
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController editingController = TextEditingController();
  bool validate = false;

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  int color1 = _getColorFromHex("#192A56");

  String cityname;
  @override
  Widget build(BuildContext context) {
    final weatherbloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      // Not Loading State
      if (state is NotloadingWeather) {
        return Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          Image.asset(
            'images/solarhouse.png',
            height: 150.0,
            width: 150.0,
          ),
          Text(
            'Check Weather..',
            style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: TextField(
              scrollPadding: EdgeInsets.all(10),
              style: TextStyle(color: Colors.white, fontSize: 20.0),
              autofocus: true,
              onChanged: (value) {},
              controller: editingController,
              decoration: InputDecoration(
                  errorText: validate ? ' Enter Your Location' : null,
                  filled: true,
                  fillColor: Color(color1),
                  labelText: "Enter location",
                  labelStyle: TextStyle(color: Colors.white, fontSize: 20.0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)))),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            width: 250.0,
            height: 40.0,
            // ignore: deprecated_member_use
            child: FlatButton(
              color: Color(color1),
              shape: new RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              onPressed: () {
                setState(() {
                  if (editingController.text.isEmpty) {
                    validate = true;
                  } else {
                    weatherbloc.add(FetchWeather(editingController.text));
                    validate = false;
                  }
                  cityname = editingController.text;
                });
                editingController.clear();
              },
              child: Text(
                'Search Location',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          )
        ]);
      }
      //Loading State
      else if (state is LoadingWeather) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      // Loaded State
      // After Getting Data
      else if (state is LoadedWeather) {
        // data is not null
        if (state.weather.temp != null) {
          String getimage() {
            if (state.weather.mainweather == 'Haze') {
              return 'images/defualt.png';
            } else if (state.weather.mainweather == 'Clouds') {
              return 'images/defualt.png';
            } else if (state.weather.mainweather == 'Clear') {
              return 'images/defualt.png';
            } else {
              return 'images/defualt.png';
            }
          }

          return WillPopScope(
            onWillPop: movetolastState,
            child: SingleChildScrollView(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(getimage()))),
                  padding: EdgeInsets.only(right: 32, left: 32, top: 10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 50),
                      Text(
                        cityname,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        state.weather.temp.round().toString() + "°C",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Temperature",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                state.weather.tempmin.round().toString() + "°C",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Min Temperature",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                state.weather.tempmax.round().toString() + "°C",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Max Temperature",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Column(
                        children: <Widget>[
                          Text(
                            state.weather.windspeed.toString() + " " + "Km/h",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Wind Speed",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: <Widget>[
                          Text(
                            state.weather.mainweather,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Weather Status",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 250.0,
                        height: 50,
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          onPressed: () {
                            BlocProvider.of<WeatherBloc>(context)
                                .add(ResetWeather());
                          },
                          color: Colors.green,
                          child: Text(
                            "Search Another..",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          );
        }

        // data is null mean no record found
        else {
          return WillPopScope(
            onWillPop: movetolastState,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/defualt.png'))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('No Data Found',
                        style: TextStyle(color: Colors.black, fontSize: 30.0)),
                    SizedBox(height: 30),
                    Container(
                      width: 250.0,
                      height: 50,
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        onPressed: () {
                          BlocProvider.of<WeatherBloc>(context)
                              .add(ResetWeather());
                        },
                        color: Colors.transparent,
                        child: Text(
                          "Try Another Location..",
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      ),
                    ),
                  ]),
            ),
          );
        }
      }
      // if not any State
      else {
        return Text(
          'Error',
        );
      }
    });
  }

  Future<bool> movetolastState() {
    _snackbarshow(context, 'Please, Click On Try Another..');
    return new Future.value(false);
  }

  void _snackbarshow(BuildContext context, String str) {
    SnackBar snackBar = SnackBar(
      backgroundColor: Colors.transparent,
      duration: Duration(seconds: 2),
      content: Text(
        str,
        style: TextStyle(fontSize: 18),
      ),
    );
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
