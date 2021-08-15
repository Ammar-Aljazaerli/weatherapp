import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/Screens/first/cubit/cubit.dart';
import 'package:weatherapp/Screens/first/cubit/state.dart';
import 'package:weatherapp/utilities/constants.dart';
import 'package:weatherapp/widgets/weather_item_card.dart';

class HomeWeatherScreen extends StatelessWidget {
  HomeWeatherScreen({Key? key}) : super(key: key);
   DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherAppCubit, WeatherAppStates>(
        listener: (context, state) {},
        builder: (context, stata) {
          var cubit = WeatherAppCubit.get(context).weatherModel;
          return Scaffold(
            body: cubit.cod != '200'
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 30.0),
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
                                  '${cubit.city!.name}',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.grey[600]),
                                ),
                                Text(
                                  DateFormat('EE dd/MM/yyyy').format(date),
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
                                  '${cubit.list![0].weather![0].main}',
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${kToC(cubit.list![0].main!.tempMax)}/${kToC(cubit.list![0].main!.tempMin)}°C',
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
                                    'assets/icons/Mostly Sunny.svg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      '${kToC(cubit.list![0].main!.temp)}°C',
                                      style: TextStyle(
                                          fontSize: 40.0,
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Text(
                              '5-day Forecast',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey[700],
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              height: 150.0,
                              width: double.infinity,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    var dateDays =
                                        DateFormat("yyyy-MM-dd hh:mm:ss").parse(
                                            cubit.list![index].dtTxt
                                                .toString());

                                    return WeatherItemCard(
                                        index: index,
                                        dateDays: dateDays,
                                        model: cubit);
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      width: 10.0,
                                    );
                                  },
                                  itemCount: 5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        });
  }
}
