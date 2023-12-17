import 'package:arbiter_pm/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../constants/image_paths.dart';
import '../controllers/carousel_controller.dart';

class LandingCarousel extends GetView<CarouseLController> {
  const LandingCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _ = MediaQuery.of(context).size;
    final List<String> landingImageList = [
      landingImage1,
      landingImage2,
      landingImage3
    ];

    return Stack(
      children: [
        CarouselSlider(
          carouselController: controller.slideController,
          options: controller.slideOptions,
          items: List.generate(
            landingImageList.length,
            (index) => Image.asset(
              landingImageList[index],
              fit: BoxFit.cover,
              width: _.width,
            ),
          ),
        ),
      ],
    );
  }
}

class MenuButton extends StatefulWidget {
  const MenuButton({Key? key}) : super(key: key);

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 10,
        top: 10,
        child: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: (() {
            if (value == 0) {
              setState(() {
                value = 1;
              });
            } else {
              setState(() {
                value = 0;
              });
            }
          }),
        ));
  }
}
