import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const _apiKey = '0c808420a8c2afababb35a2146bfb935';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$_apiKey&units=metric';
    UserLocation loc = new UserLocation();
    await loc.determinePosition();
    Network network = new Network(Uri.parse(url));
    var retrievedData = await network.getData();
    return retrievedData;
  }

  Future<dynamic> getLocationWeather() async {
    UserLocation loc = new UserLocation();
    await loc.determinePosition();
    Network network = new Network(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude.toInt()}&lon=${loc.longitude.toInt()}&appid=$_apiKey&units=metric'));
    var retrievedData = await network.getData();
    return retrievedData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time in';
    } else if (temp > 20) {
      return 'Time for shorts and ๐ in';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค in';
    } else {
      return 'Bring a ๐งฅ just in case to';
    }
  }
}
