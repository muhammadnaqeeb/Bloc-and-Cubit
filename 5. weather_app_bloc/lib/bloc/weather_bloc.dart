import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app_bloc/data/repository/weather_repository.dart';
import 'package:weather_app_bloc/model/weather_model.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  // for more clearification, see diagram, as repository is interacting with bloc
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherFetched>(_getCurrentWeather);
  }

  void _getCurrentWeather(
    WeatherFetched event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    try {
      // give us weather model
      final weather = await weatherRepository.getCurrentWeather();
      emit(WeatherSuccess(weatherModel: weather));
    } catch (e) {
      emit(WeatherFailure(error: e.toString()));
    }
  }
}
