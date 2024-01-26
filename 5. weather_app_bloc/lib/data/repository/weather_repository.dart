import 'dart:convert';

import 'package:weather_app_bloc/data/data_provider/weather_data_provider.dart';
import 'package:weather_app_bloc/model/weather_model.dart';

class WeatherRepository {
  final WeaterDataProvider weaterDataProvider;

  WeatherRepository(this.weaterDataProvider);
  Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'Karachi';
      // calling data provider
      // you can do like this but, if you are unit testing, you don't want to create instance over have
      // you want to get it by the constructor
      //WeaterDataProvider().getCurrentWeather(cityName);
      // by constructor
      final weatherDate = await weaterDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weatherDate);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      // return WeatherModel.fromJson(weatherDate);
      // OR
      return WeatherModel.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
