import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff474562),
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Full\nmoon\nnight\n12345789'),
                    FloatingActionButton(onPressed: null)
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/sun.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Full moon night 123456789',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          '79*',
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                        Text('feels like 32*'),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
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
                        SizedBox(
                          width: 10,
                        ),
                        Column(
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
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
