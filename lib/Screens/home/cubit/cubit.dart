import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Screens/home/cubit/state.dart';
import 'package:weatherapp/models/weather_daily_model.dart';
import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/network.dart';

// var url1 = Uri.parse(
//     'https://api.openweathermap.org/data/2.5/forecast?id=292223&appid=7956ac64be1e40e0f8bbb3aebfd4d201');

class WeatherAppCubit extends Cubit<WeatherAppStates> {
  WeatherAppCubit() : super(WeatherAppInitialState());

  static WeatherAppCubit get(context) => BlocProvider.of(context);

  Location location = Location();
  WeatherModel weatherModel = WeatherModel();
  // WeatherModel searchWeatherModel = WeatherModel();
  void fetchDataFromApi() async {
    emit(WeatherAppLoadinDatagState());
    await location.getCurrentLocation();
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=${location.latitude}&lon=${location.longitude}&exclude={part}&appid=7956ac64be1e40e0f8bbb3aebfd4d201');
    NetworkHelper networkHelper = NetworkHelper(url);
    networkHelper.getData().then((value) {
      weatherModel = WeatherModel.fromJson(value);
      print(weatherModel.timezone);
      emit(WeatherAppFinishGetDataState());
    });
  }

  // searchByCityName(String city) {
  //   emit(WeatherAppLoadingSearchDataState());
  //   var searchUrl = Uri.parse(
  //       'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=7956ac64be1e40e0f8bbb3aebfd4d201');
  //   NetworkHelper networkHelper = NetworkHelper(searchUrl);
  //   networkHelper.getData().then((value) {
  //     searchWeatherModel = WeatherModel.fromJson(value);
  //
  //     print(searchWeatherModel.timezone);
  //     emit(WeatherAppFinishSearchGetDataState());
  //   }).catchError((error) {
  //     print(error);
  //     emit(WeatherAppErrorSearchGetDataState());
  //   });
  // }
}
