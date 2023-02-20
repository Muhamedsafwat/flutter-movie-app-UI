import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movie_app_ui/components/masked_image.dart';
import 'package:movie_app_ui/components/search_field.dart';
import 'package:movie_app_ui/models/movie.dart';

import '../constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      body: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: [
              Positioned(
                top: screenHeight * 0.3,
                right: -100,
                child: Container(
                  width: 166,
                  height: 166,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.kPinkColor,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                    child: const SizedBox(
                      width: 166,
                      height: 166,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -100,
                left: -100,
                child: Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.kCyanColor.withOpacity(.5),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
                    child: const SizedBox(
                      width: 170,
                      height: 150,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -100,
                left: -100,
                child: Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.kCyanColor.withOpacity(.5),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
                    child: const SizedBox(
                      width: 170,
                      height: 150,
                    ),
                  ),
                ),
              ),
              SafeArea(
                bottom: false,
                child: ListView(
                  physics: const BouncingScrollPhysics(
                      decelerationRate: ScrollDecelerationRate.fast),
                  primary: true,
                  children: [
                    const SizedBox(height: 35),
                    const Text(
                      "What would you \n like to watch?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 28,
                          color: Constants.kWhiteColor,
                          fontWeight: FontWeight.w700),
                    ),
                    const SearchField(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 15),
                      child: Text(
                        "Popular movies",
                        style: TextStyle(
                            color: Constants.kWhiteColor.withOpacity(.9),
                            fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(
                            decelerationRate: ScrollDecelerationRate.fast),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: newMovies.length,
                        itemBuilder: (context, index) {
                          String mask;
                          if (index == 0) {
                            mask = Constants.kMaskFirstIndex;
                          } else if (index == newMovies.length - 1) {
                            mask = Constants.kMaskLastIndex;
                          } else {
                            mask = Constants.kMaskCenter;
                          }
                          return GestureDetector(
                              child: Container(
                            margin: const EdgeInsets.only(left: 20),
                            height: 160,
                            width: 140,
                            child: MaskedImage(
                                asset: newMovies[index].moviePoster,
                                mask: mask),
                          ));
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 15),
                      child: Text(
                        "Popular movies",
                        style: TextStyle(
                            color: Constants.kWhiteColor.withOpacity(.9),
                            fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(
                            decelerationRate: ScrollDecelerationRate.fast),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: upcomingMovies.length,
                        itemBuilder: (context, index) {
                          String mask;
                          if (index == 0) {
                            mask = Constants.kMaskFirstIndex;
                          } else if (index == upcomingMovies.length - 1) {
                            mask = Constants.kMaskLastIndex;
                          } else {
                            mask = Constants.kMaskCenter;
                          }
                          return GestureDetector(
                              child: Container(
                            margin: const EdgeInsets.only(left: 15),
                            height: 160,
                            width: 140,
                            child: MaskedImage(
                                asset: upcomingMovies[index].moviePoster,
                                mask: mask),
                          ));
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
          //height: screenHeight,
          ),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(4),
        width: 64,
        height: 64,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Constants.kPinkColor, Constants.kCyanColor],
            stops: [.2, .8],
          ),
        ),
        child: RawMaterialButton(
          onPressed: () {},
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: Constants.kWhiteColor,
            size: 32,
          ),
          fillColor: const Color(0xff404075),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: GlassmorphicContainer(
        blur: 10,
        border: 0,
        borderRadius: 0,
        height: 70,
        width: screenWidth,
        borderGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Constants.kPinkColor.withOpacity(.8),
              Constants.kCyanColor.withOpacity(.8)
            ]),
        linearGradient: LinearGradient(colors: [
          Constants.kWhiteColor.withOpacity(.05),
          Constants.kWhiteColor.withOpacity(.05)
        ]),
        child: BottomAppBar(
          padding: const EdgeInsets.all(5),
          elevation: 0,
          notchMargin: 4,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.home,
                  color: Constants.kWhiteColor,
                  size: 32,
                ),
              )),
              Expanded(
                  child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.airplay,
                  color: Constants.kWhiteColor.withOpacity(.5),
                  size: 32,
                ),
              )),
              const Expanded(child: Text("")),
              Expanded(
                  child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.layers,
                  color: Constants.kWhiteColor.withOpacity(.5),
                  size: 32,
                ),
              )),
              Expanded(
                  child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.download,
                  color: Constants.kWhiteColor.withOpacity(.5),
                  size: 32,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
