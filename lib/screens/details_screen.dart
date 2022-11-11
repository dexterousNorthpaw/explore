import 'package:carousel_slider/carousel_slider.dart';
import 'package:explore/models/country_model.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key, required this.e}) : super(key: key);
  final CountryModel e;
  CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 380,
                height: 200,
                child: Stack(
                  children: [
                    CarouselSlider(
                        carouselController: carouselController,
                        items: [
                          Container(
                            margin: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(e.flags!.png.toString()),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(e.coatOfArms!.png.toString()),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ], options: CarouselOptions(
                      height: 250.0,
                      // enlargeCenterPage: true,
                      // autoPlay: true,
                      // autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 1,
                    )),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          // Use the controller to change the current page
                          carouselController.previousPage();
                        },
                        icon: Icon(Icons.arrow_circle_left_outlined),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          // Use the controller to change the current page
                          carouselController.nextPage();
                        },
                        icon: Icon(Icons.arrow_circle_right_outlined),
                      ),
                    ),
                  ],
                ),
              ),
              Text(e.name!.official.toString()),
              Text(e.population.toString()),
              Text(e.capital!.isEmpty? '': e.capital![0].toString()),
              Text(e.startOfWeek.toString()),
              Text(e.timezones![0]),
            ],
          ),
        ),
      ),
    );
  }
}
