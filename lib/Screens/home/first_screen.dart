import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:weatherapp/Screens/deteils_weather/second_screen.dart';
import 'package:weatherapp/Screens/home/cubit/cubit.dart';
import 'package:weatherapp/Screens/home/cubit/state.dart';
import 'package:weatherapp/Screens/search/search_by_name_screen.dart';
import 'package:weatherapp/widgets/mean_weather_widget.dart';
import 'package:weatherapp/widgets/weather_item_card.dart';

class HomeWeatherScreen extends StatelessWidget {
  HomeWeatherScreen({Key? key}) : super(key: key);
  DateTime date = DateTime.now();
  String city = 'london';
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final orientation = MediaQuery.of(context).orientation;
    return BlocConsumer<WeatherAppCubit, WeatherAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = WeatherAppCubit.get(context).weatherModel;
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: SearchNowWeatherScreen(),
                        type: PageTransitionType.bottomToTop,
                        alignment: Alignment.topCenter));
              },
              child: const Icon(
                FontAwesomeIcons.searchLocation,
              ),
            ),
            body: SafeArea(
              child: cubit.timezone == null
                  ? Container(
                      height: height,
                      width: width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(),
                          const Text(
                            'Getting your location...',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 4 / 100,
                          vertical: height * 4 / 100),
                      height: height,
                      width: width,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MeanWeatherInformation(
                              width: width,
                              height: height,
                              model: cubit,
                              date: date,
                              nextScreen: WeatherDetailsScreen(),
                            ),
                            Text(
                              ' 7-day Forecast',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey[700],
                              ),
                            ),
                            SizedBox(
                              height: height * 2 / 100,
                            ),
                            Container(
                              height: height * 30 / 100,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return WeatherItemCard(
                                      index: index + 1,
                                      model: cubit.daily,
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      width: width * 1 / 100,
                                    );
                                  },
                                  itemCount: cubit.daily!.length - 1),
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
