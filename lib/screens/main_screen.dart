import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    double safeWidth = MediaQuery.of(context).size.width - 40;
    double safeHeight =
        MediaQuery.of(context).size.height - padding.top - padding.bottom - 40;

    return Scaffold(
      backgroundColor: Color(0xff474562),
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Weather Description
                Container(
                  height: safeHeight * 0.2,
                  width: safeWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: double.infinity,
                        width: safeWidth * 0.30,
                        child: FittedBox(
                          child: Text(
                            'Full\nmoon\nnight',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Weather Icon
                Container(
                  height: safeHeight * .55,
                  width: safeWidth,
                  child: FittedBox(
                    child: Image.asset('images/sun.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                // CityName, CountryName
                Container(
                  // TODO: Find a way to align text left.
                  height: safeHeight * 0.05,
                  width: safeWidth * 0.5,
                  child: FittedBox(
                    child: Text(
                      'Moscow, Russia',
                    ),
                  ),
                ),
                // Bottom Bar Info
                Container(
                  height: safeHeight * 0.2,
                  width: safeWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Temperature (w/ feels like temperature)
                      Container(
                        height: double.infinity,
                        width: safeWidth * 0.4,
                        child: Column(
                          children: [
                            Container(
                              height: safeHeight * 0.2 * 0.75,
                              width: double.infinity,
                              child: FittedBox(
                                child: Text(
                                  '79*',
                                  style: TextStyle(
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: safeHeight * 0.2 * 0.25,
                              width: safeWidth * 0.4 * .75,
                              child: FittedBox(
                                child: Text(
                                  'feels like 32*',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // 3 Upcoming  Temperatures
                      Container(
                        height: double.infinity,
                        width: safeWidth * 0.6,
                        child: Row(
                          children: [
                            Container(
                              height: double.infinity,
                              width: safeWidth * 0.6 * 0.33,
                              child: Column(
                                children: [
                                  Text('14:00'),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('images/cloud.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text('74*'),
                                ],
                              ),
                            ),
                            Container(
                              height: double.infinity,
                              width: safeWidth * 0.6 * 0.33,
                              child: Column(
                                children: [
                                  Text('18:00'),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('images/cloud.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text('70*'),
                                ],
                              ),
                            ),
                            Container(
                              height: double.infinity,
                              width: safeWidth * 0.6 * 0.33,
                              child: Column(
                                children: [
                                  Text('18:00'),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('images/cloud.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text('70*'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
