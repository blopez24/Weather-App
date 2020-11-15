class Weather {
  /// Json weather data obtained from openweatherapi.
  final jsonWeatherData;
  Weather({this.jsonWeatherData});

  String getDescription() {
    return this.jsonWeatherData['weather'][0]['description'];
  }

  String getCityName() {
    return this.jsonWeatherData['name'];
  }

  int getWeatherIconID() {
    return this.jsonWeatherData['weather'][0]['id'];
  }

  int getTemp() {
    return this.jsonWeatherData['main']['temp'].toInt();
  }

  int getFeelsTemp() {
    return this.jsonWeatherData['main']['feels_like'].toInt();
  }

  int getMinTemp() {
    return this.jsonWeatherData['main']['temp_min'].toInt();
  }

  int getMaxTemp() {
    return this.jsonWeatherData['main']['temp_max'].toInt();
  }

  List<DateTime> getSunsetAndSunrise() {
    var sunriseUTC = jsonWeatherData['sys']['sunrise'];
    var sunsetUTC = jsonWeatherData['sys']['sunset'];
    var sunrise = new DateTime.fromMillisecondsSinceEpoch(sunriseUTC * 1000);
    var sunset = new DateTime.fromMillisecondsSinceEpoch(sunsetUTC * 1000);
    return [sunrise, sunset];
  }
}
