class Weather {
  /// Json weather data obtained from openweatherapi.
  final jsonWeatherData;
  Weather({this.jsonWeatherData});

  getDescription() => this.jsonWeatherData['weather'][0]['description'];

  getCityName() => this.jsonWeatherData['name'];

  getWeatherIconID() => this.jsonWeatherData['weather'][0]['id'];

  getTemp() => this.jsonWeatherData['main']['temp'].toInt();

  getFeelsTemp() => this.jsonWeatherData['main']['feels_like'].toInt();

  getMinTemp() => this.jsonWeatherData['main']['temp_min'].toInt();

  getMaxTemp() => this.jsonWeatherData['main']['temp_max'].toInt();

  List<DateTime> getSunsetAndSunrise() {
    var sunriseUTC = jsonWeatherData['sys']['sunrise'];
    var sunsetUTC = jsonWeatherData['sys']['sunset'];
    var sunrise = new DateTime.fromMillisecondsSinceEpoch(sunriseUTC * 1000);
    var sunset = new DateTime.fromMillisecondsSinceEpoch(sunsetUTC * 1000);
    return [sunrise, sunset];
  }
}
