import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app_ui/components/custom_outline.dart';
import 'package:movie_app_ui/constants.dart';
import 'package:movie_app_ui/screens/home_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

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
              top: screenHeight * 0.1,
              left: -88,
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
              top: screenHeight * 0.3,
              right: -100,
              child: Container(
                width: 170,
                height: 170,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kCyanColor,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                  child: const SizedBox(
                    width: 170,
                    height: 170,
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * .2,
                  ),
                  CustomOutline(
                    strokeWidth: 4,
                    radius: screenWidth * .7,
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [
                          0.2,
                          0.4,
                          0.6,
                          0.8
                        ],
                        colors: [
                          Constants.kPinkColor,
                          Constants.kPinkColor.withOpacity(0.05),
                          Constants.kCyanColor.withOpacity(0.05),
                          Constants.kCyanColor
                        ]),
                    width: screenWidth * .7,
                    height: screenWidth * .7,
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/img-onboarding.png"),
                              fit: BoxFit.cover,
                              alignment: Alignment.bottomLeft)),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * .04,
                  ),
                  Text(
                    "Watch movies in \n Virtual Reality ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      color: Constants.kWhiteColor.withOpacity(.9),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * .015,
                  ),
                  Text(
                    "Download and watch offline \n wherever you are!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Constants.kWhiteColor.withOpacity(.7),
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * .025,
                  ),
                  CustomOutline(
                    strokeWidth: 3,
                    radius: 20,
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.1, 0.9],
                        colors: [Constants.kPinkColor, Constants.kCyanColor]),
                    width: 160,
                    height: 40,
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: const [
                              0.1,
                              0.9
                            ],
                            colors: [
                              Constants.kPinkColor.withOpacity(.3),
                              Constants.kCyanColor.withOpacity(.3)
                            ]),
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        ),
                        child: Center(
                            child: Text("Sign up",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Constants.kWhiteColor.withOpacity(.9),
                                  fontWeight: FontWeight.w600,
                                ))),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, ((index) {
                        return Container(
                            width: 8,
                            height: 8,
                            margin: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == 0
                                    ? Constants.kCyanColor
                                    : Constants.kWhiteColor));
                      }))),
                  SizedBox(
                    height: screenHeight * .02,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
