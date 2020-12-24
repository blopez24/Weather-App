const days = ['', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

class Weather {
  /// Json weather data obtained from openweatherapi.
  final jsonWeatherData;
  Weather({this.jsonWeatherData});

  getDescription() => this.jsonWeatherData['weather'][0]['description'];

  getCityName() => this.jsonWeatherData['name'];

  getWeatherIconID() => this.jsonWeatherData['weather'][0]['id'];

  getTemp() => this.jsonWeatherData['main']['temp'].round();

  getFeelsTemp() => this.jsonWeatherData['main']['feels_like'].round();

  getMinTemp() => this.jsonWeatherData['main']['temp_min'].round();

  getMaxTemp() => this.jsonWeatherData['main']['temp_max'].round();

  List<DateTime> getSunsetAndSunrise() {
    var sunriseUTC = jsonWeatherData['sys']['sunrise'];
    var sunsetUTC = jsonWeatherData['sys']['sunset'];
    var sunrise = new DateTime.fromMillisecondsSinceEpoch(sunriseUTC * 1000);
    var sunset = new DateTime.fromMillisecondsSinceEpoch(sunsetUTC * 1000);
    return [sunrise, sunset];
  }

  List<Forecast> getForecastHourly() {
    List<Forecast> hourly = new List();
    var jsonHourly = this.jsonWeatherData['hourly'];
    for (int i = 0; i < 12; i++) {
      var hour = jsonHourly[i]['dt'];
      hour = new DateTime.fromMillisecondsSinceEpoch(hour * 1000);
      hour = (hour.hour % 12 == 0) ? '12:00' : '${hour.hour % 12}:00';
      int temp = jsonHourly[i]['temp'].round();
      int icon = jsonHourly[i]['weather'][0]['id'];
      Forecast h = new Forecast(time: hour, temperature: temp, icon: icon);
      hourly.add(h);
    }
    return hourly;
  }

  List<Forecast> getForecastDaily() {
    List<Forecast> daily = new List();
    var jsonDaily = this.jsonWeatherData['daily'];
    for (int i = 1; i < 6; i++) {
      var date = jsonDaily[i]['dt'];
      date = new DateTime.fromMillisecondsSinceEpoch(date * 1000);
      date = days[date.weekday];

      int temp = jsonDaily[i]['temp']['day'].round();
      int icon = jsonDaily[i]['weather'][0]['id'];
      Forecast h = new Forecast(time: date, temperature: temp, icon: icon);
      daily.add(h);
    }
    return daily;
  }
}

class Forecast {
  final time;
  final temperature;
  final icon;
  Forecast({this.time, this.temperature, this.icon});

  @override
  String toString() {
    return 'Time: $time\tTemperature: $temperature\tIcon: $icon\t';
  }

  getTime() => this.time;
  int getTimeInt() {
    int index = time.indexOf(':');
    int number = int.parse(time.substring(0, index));
    return number;
  }

  getTemperature() => this.temperature;
  getIcon() => this.icon;
}
