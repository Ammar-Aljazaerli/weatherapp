import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/Screens/home/cubit/cubit.dart';
import 'package:weatherapp/Screens/home/cubit/state.dart';
import 'package:weatherapp/models/weather_daily_model.dart';
import 'package:weatherapp/utilities/constants.dart';
import 'package:weatherapp/widgets/mean_weather_widget.dart';

class WeatherDetailsScreen extends StatelessWidget {
  WeatherDetailsScreen({
    Key? key,
  }) : super(key: key);
  int? indexH;
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocConsumer<WeatherAppCubit, WeatherAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = WeatherAppCubit.get(context).weatherModel;

        return Scaffold(
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 4 / 100, vertical: height * 4 / 100),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MeanWeatherInformation(
                      height: height, width: width, model: cubit, date: date),
                  SizedBox(height: 15.0),
                  Text(
                    'Hours in days:',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: height * 1 / 100),
                  Expanded(
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return WeatherDetailsInHour(
                              model: cubit, index: index);
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: Colors.black,
                            endIndent: width * 5 / 100,
                            indent: width * 5 / 100,
                          );
                        },
                        itemCount: 24),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String convertToHour(text) {
    var d = DateFormat('h:mm').format(text);
    return d.toString();
  }
}

class WeatherDetailsInHour extends StatelessWidget {
  WeatherDetailsInHour({
    Key? key,
    required this.model,
    required this.index,
  }) : super(key: key);
  final WeatherModel model;
  final int index;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Container(
          height: height * 3 / 100,
          width: height * 3 / 100,
          child: SvgPicture.asset(
            findIcon(model.hourly![index].weather![0].description.toString()),
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(width: width * 2 / 100),
        Text('${model.hourly![index].dt}'),
        SizedBox(width: width * 2 / 100),
        Text('${model.hourly![index].weather![0].description}'),
        Spacer(),
        Column(
          children: [
            Text('${model.hourly![index].windSpeed.toStringAsFixed(1)}m/s'),
            SizedBox(
              height: height * 1 / 100,
            ),
            Icon(
              FontAwesomeIcons.wind,
              size: width * 3 / 100,
            ),
          ],
        ),
        SizedBox(width: width * 3 / 100),
        Column(
          children: [
            Text('${model.hourly![index].feelsLike}°C'),
            SizedBox(
              height: height * 1 / 100,
            ),
            Icon(
              FontAwesomeIcons.temperatureHigh,
              size: width * 3 / 100,
            ),
          ],
        ),
        SizedBox(width: width * 3 / 100),
        Column(
          children: [
            Text('${model.hourly![index].humidity!.toString()}%'),
            SizedBox(
              height: height * 1 / 100,
            ),
            Icon(
              FontAwesomeIcons.water,
              size: width * 3 / 100,
            ),
          ],
        ),
      ],
    );
  }
}

class WeatherDetailsInDay extends StatelessWidget {
  const WeatherDetailsInDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30.0,
          width: 30.0,
          child: SvgPicture.asset(
            'assets/icons/Sleet Night.svg',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Text('12:00'),
        SizedBox(
          width: 10.0,
        ),
        Text('.Partly Cloudy'),
        Spacer(),
        Text('34°'),
      ],
    );
  }
}
