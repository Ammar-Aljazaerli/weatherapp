import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Screens/first/cubit/state.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/network.dart';
import 'package:weatherapp/utilities/constants.dart';

class WeatherAppCubit extends Cubit<WeatherAppStates> {
  WeatherAppCubit() : super(WeatherAppInitialState());

  static WeatherAppCubit get(context) => BlocProvider.of(context);
  NetworkHelper networkHelper = NetworkHelper(url);

  WeatherModel weatherModel = WeatherModel();
  void getWeatherData() {
    emit(WeatherAppLoadinDatagState());
    networkHelper.getData().then((value) {
      weatherModel = WeatherModel.fromJson(value);
      emit(WeatherAppFinishGetDataState());
    }).catchError((error) {
      print(error);
      emit(WeatherAppErrorGetDataState());
    });
  }
}
