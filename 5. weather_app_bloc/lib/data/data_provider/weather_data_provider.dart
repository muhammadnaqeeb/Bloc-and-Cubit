// all the CURD related tasks, API calls etc are done in this file

import 'package:http/http.dart' as http;
import 'package:weather_app_bloc/secrets.dart';

class WeaterDataProvider {
  Future<String> getCurrentWeather(String cityName) async {
    try {
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey',
        ),
      );
      // we don't decode the data here
      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }
}
