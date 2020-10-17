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
                  height: safeHeight * 0.15,
                  width: safeWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: double.infinity,
                        width: safeWidth * 0.30,
                        child: FittedBox(
                          child: Text(
                            'Full Moon\nNight',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Weather Icon
                Container(
                  height: safeHeight * .60,
                  width: safeWidth,
                  child: FittedBox(
                    child: Image.asset('images/sun.png'),
                    fit: BoxFit.cover,
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
                                  '79°',
                                  style: TextStyle(
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // TODO: Align text left.
                              height: safeHeight * 0.2 * 0.25,
                              width: safeWidth * 0.4 * .75,
                              child: FittedBox(
                                child: Text(
                                  'feels like 32°',
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
                            // +3 Hour
                            UpcomingPrediction(
                              safeWidth: safeWidth,
                              safeHeight: safeHeight,
                              time: '06:00',
                              temperature: '76°',
                            ),
                            // +6 Hour
                            UpcomingPrediction(
                              safeWidth: safeWidth,
                              safeHeight: safeHeight,
                              time: '09:00',
                              temperature: '70°',
                            ),
                            // +9 Hour
                            UpcomingPrediction(
                              safeWidth: safeWidth,
                              safeHeight: safeHeight,
                              time: '12:00',
                              temperature: '64°',
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

class UpcomingPrediction extends StatelessWidget {
  const UpcomingPrediction({
    Key key,
    @required this.safeWidth,
    @required this.safeHeight,
    @required this.time,
    @required this.temperature,
  }) : super(key: key);

  final double safeWidth;
  final double safeHeight;
  final String time;
  // TODO: ICON
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: safeWidth * 0.6 * 0.33,
      child: Column(
        children: [
          // SizeBox Equivalent
          Container(
            height: safeHeight * 0.2 * 0.1,
            width: double.infinity,
          ),
          // 3 Hour Prediction
          Container(
            height: safeHeight * 0.2 * 0.266,
            width: double.infinity,
            child: FittedBox(
              child: Text(
                time,
              ),
            ),
          ),
          // Icon
          Container(
            height: safeHeight * 0.2 * 0.266,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/cloud.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Temperature
          Container(
            height: safeHeight * 0.2 * 0.266,
            width: double.infinity,
            child: FittedBox(
              child: Text(
                temperature,
              ),
            ),
          ),
          // SizeBox Equivalent
          Container(
            height: safeHeight * 0.2 * 0.1,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
