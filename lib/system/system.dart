import 'package:flutter/material.dart';
import '../reusablecard/reusable.dart';

class System extends StatefulWidget {
  @override
  _SystemState createState() => _SystemState();
}

class _SystemState extends State<System> {
  int units = 180;
  int price = 3900;
  String kilowatt = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Reusablecard(
              color: Colors.transparent,
              card: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Calculate Cost :',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        price.toString(),
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text('Rs.'),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.yellowAccent,
                      activeTrackColor: Colors.deepOrangeAccent,
                      overlayColor: Colors.deepOrange,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: price.toDouble(),
                      min: 1.0,
                      max: 1000000.0,
                      activeColor: Colors.blueAccent,
                      inactiveColor: Colors.red,
                      onChanged: (double value) {
                        setState(() {
                          price = value.toInt();

                          var x = price * 0.0002;
                          var a = price * 0.02;
                          units = a.toInt();
                          kilowatt = x.toStringAsFixed(0);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Reusablecard(
              color: Colors.transparent,
              card: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'How Many Units :',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        units.toString(),
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text('Units'),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.yellowAccent,
                      activeTrackColor: Colors.deepOrangeAccent,
                      overlayColor: Colors.deepOrange,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: units.toDouble(),
                      min: 1.0,
                      max: 200000.0,
                      activeColor: Colors.blueAccent,
                      inactiveColor: Colors.red,
                      onChanged: (double newvalue) {
                        setState(() {
                          units = newvalue.toInt();
                          var x = newvalue * 4;
                          price = x.toInt();

                          var y = units * 0.002;
                          kilowatt = y.toStringAsFixed(0);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Reusablecard(
            color: Colors.white,
            card: Column(
              children: [
                Text(
                  'Kilowatt',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    kilowatt,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BillSystem()));
                  },
                  child: Text(
                    'Bill Calculate',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class BillSystem extends StatefulWidget {
  @override
  _BillSystemState createState() => _BillSystemState();
}

class _BillSystemState extends State<BillSystem> {
  int kw = 5;
  double uni;
  double rs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        title: Center(
          child: Image.asset(
            'images/solarhouse.png',
            height: 105,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Reusablecard(
                color: Colors.transparent,
                card: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Enter Your System Size(kw) :',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          kw.toString(),
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text('Kilowatt'),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Colors.yellowAccent,
                        activeTrackColor: Colors.deepOrangeAccent,
                        overlayColor: Colors.deepOrange,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 10.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: kw.toDouble(),
                        min: 0.0,
                        max: 500.0,
                        activeColor: Colors.blueAccent,
                        inactiveColor: Colors.red,
                        onChanged: (double value) {
                          setState(() {
                            kw = value.toInt();

                            uni = kw * 5.0;
                            rs = kw * 1800.0;
                          });
                        },
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     FloatingActionButton(
                    //       onPressed: () {
                    //         setState(() {
                    //           if (kw == 5) {
                    //             kw = 1;
                    //           } else if (kw == 1) {
                    //             kw = 1;
                    //           } else {
                    //             kw = kw - 5;
                    //           }
                    //         });
                    //       },
                    //       child: Icon(Icons.remove),
                    //       backgroundColor: Colors.red,
                    //     ),
                    //     SizedBox(
                    //       width: 150.0,
                    //     ),
                    //     FloatingActionButton(
                    //       onPressed: () {
                    //         setState(() {
                    //           if (kw == 500) {
                    //             kw = 500;
                    //           } else {
                    //             kw = kw + 5;
                    //           }
                    //         });
                    //       },
                    //       child: Icon(Icons.add),
                    //       backgroundColor: Colors.green,
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Reusablecard(
                color: Colors.transparent,
                card: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Monthly Units(KWh) :',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Container(
                            child: Text(
                              uni.toString(),
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Monthly Bill Covering Price :',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Container(
                            child: Text(
                              rs.toString(),
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
