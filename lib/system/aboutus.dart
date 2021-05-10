import 'package:flutter/material.dart';
import '../reusablecard/reusable.dart';

class Aboutus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
              child: Image.asset(
            'images/solarhouse.png',
            height: 170,
          )),
          Expanded(
            child: SingleChildScrollView(
              child: Align(
                alignment: Alignment(0, -2),
                child: Text(
                  'If You Need Help \n Feel Free To Contact Us...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),
          ),
          Text(
            'Solarhouse.lk collaborate with NISINI Solutions PVT Limited, '
            'is a Solar Power Company in Sri Lanka, which provides its customers '
            'with the best worldwide Expertise and Technology who is committed to giving '
            'the best smart solar energy experience to the community in Sri Lanka by using the '
            'latest technology',
            maxLines: 7,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                      )
                    ]),
                    height: 100,
                    width: 150,

                    //color: Colors.white,
                    child: Column(
                      children: [
                        Icon(
                          Icons.email,
                          color: Colors.black,
                          size: 50,
                        ),
                        Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'info@solarhouse.lk',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 20,
                        )
                      ]),
                      height: 100,
                      width: 150,
                      // color: Colors.white,
                      child: Column(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.black,
                            size: 50,
                          ),
                          Text(
                            'Call Us',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '011 711 1610',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
