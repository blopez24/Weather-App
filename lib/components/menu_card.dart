import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';

import 'package:weather_app/screens/loading_screen.dart';
import 'package:weather_app/screens/settings_screen.dart';

enum OptionsMenu { refresh, settings }

class MenuButtonCard extends StatelessWidget {
  const MenuButtonCard({
    Key key,
    @required this.safeHeight,
    @required this.safeWidth,
  }) : super(key: key);

  final double safeHeight;
  final double safeWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: safeHeight * 0.125,
      width: safeWidth * 0.2,
      child: FittedBox(
        child: PopupMenuButton<OptionsMenu>(
          color: Theme.of(context).textTheme.bodyText1.color,
          child: Padding(
            /// TODO: Find a better fix to alignment.
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
            child: Icon(
              Icons.more_vert,
              color: Theme.of(context).accentColor,
            ),
          ),
          onSelected: (OptionsMenu item) {
            switch (item) {
              case OptionsMenu.refresh:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return LoadingScreen();
                  }),
                );
                break;
              case OptionsMenu.settings:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SettingScreen();
                  }),
                );
                print('Settings');
                break;
            }
          },
          itemBuilder: (context) => <PopupMenuEntry<OptionsMenu>>[
            PopupMenuItem<OptionsMenu>(
              value: OptionsMenu.refresh,
              child: Text(
                'Refresh',
                style: kMainTextStyle.copyWith(
                  /// Adjust Font ???
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            PopupMenuItem<OptionsMenu>(
              value: OptionsMenu.settings,
              child: Text(
                'Settings',
                style: kMainTextStyle.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
