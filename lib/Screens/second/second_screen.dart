import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/Screens/first/cubit/cubit.dart';
import 'package:weatherapp/Screens/first/cubit/state.dart';
import 'package:weatherapp/utilities/constants.dart';

class WeatherDeteilsScreen extends StatelessWidget {
  WeatherDeteilsScreen({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherAppCubit, WeatherAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = WeatherAppCubit.get(context).weatherModel;
        var dateDays = DateFormat("yyyy-MM-dd hh:mm:ss")
            .parse(cubit.list![index].dtTxt.toString());
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Damascus',
                          style: TextStyle(
                              fontSize: 20.0, color: Colors.grey[600]),
                        ),
                        Text(
                          '${DateFormat('EE dd/MM/yyyy').format(dateDays)}',
                          style: TextStyle(
                              fontSize: 20.0, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Clear',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '34/29°C',
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.0),
                          height: 130.0,
                          width: 130.0,
                          child: SvgPicture.asset(
                            'assets/icons/Sleet Night.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Center(
                          child: Text(
                            '30°C',
                            style: TextStyle(
                                fontSize: 40.0,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              var timeString = DateFormat("yyyy-MM-dd hh:mm:ss")
                                  .parse(cubit.list![index].dtTxt.toString());
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
                                  Text('${convertToDay(timeString)}'),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                      '${cubit.list![index].weather![0].description}'),
                                  Spacer(),
                                  Text(
                                      '${kToC(cubit.list![index].main!.temp)}°'),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                            itemCount: 9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String convertToDay(text) {
    var d = DateFormat('h:mm').format(text);
    return d.toString();
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
