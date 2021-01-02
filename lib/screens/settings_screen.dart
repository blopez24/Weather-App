import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // int _value = 1;

  BoxDecoration customBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Theme.of(context).accentColor,
        width: 4.0,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Settings',
          style: kSettingTextStyle.copyWith(
            color: Theme.of(context).textTheme.bodyText1.color,
            fontSize: 30,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: customBoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      'Theme:',
                      style: kSettingTextStyle.copyWith(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontSize: 25,
                      ),
                    ),
                    Divider(
                      thickness: 2.5,
                      color: Theme.of(context).accentColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dark',
                          style: kSettingTextStyle.copyWith(
                            color: Theme.of(context).textTheme.bodyText1.color,
                            fontSize: 20,
                          ),
                        ),
                        Radio(
                          value: null,
                          groupValue: null,
                          onChanged: null,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Light',
                          style: kSettingTextStyle.copyWith(
                            color: Theme.of(context).textTheme.bodyText1.color,
                            fontSize: 20,
                          ),
                        ),
                        Radio(
                          /// Change color values
                          activeColor: Colors.white,
                          hoverColor: Colors.white,
                          focusColor: Colors.white,
                          value: null,
                          groupValue: null,
                          onChanged: null,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
