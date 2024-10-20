import 'dart:math';
import 'package:arbiter_pm/widgets/drawer_button.dart';
import 'package:arbiter_pm/widgets/responsive_widget.dart';
import 'package:arbiter_pm/widgets/small_social_card.dart';
import 'package:flutter/material.dart' hide DrawerButton;
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../constants/constants.dart';
import '../constants/image_paths.dart';
import '../constants/text_logs.dart';
import '../controllers/scrolling_controller.dart';

class PortfolioDrawer extends StatefulWidget {
  const PortfolioDrawer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<PortfolioDrawer> createState() => _PortfolioDrawerState();
}

class _PortfolioDrawerState extends State<PortfolioDrawer> {
  static var scrollcontroller = Get.find<ScrollingController>();

  List<String> menuItems = [
    'Home',
    'About',
    'Services',
    'Our Work',
    'Testimonials',
  ];

  @override
  Widget build(BuildContext context) {
    final Size _ = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: _.width * .9,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: theme.brightness == Brightness.light
                    ? [primaryColor, kPink]
                    : [davyGrey, eerieBlack],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
          SafeArea(
            child: Container(
              width: _.width * .45,
              padding: const EdgeInsets.all(kDefaultPadding * 1.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 255,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: kDefaultPadding),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 2, // thickness
                                            color: Colors.white // color
                                            ),
                                        // border radius
                                        borderRadius:
                                            BorderRadius.circular(16))),
                                onPressed: () {
                                  Navigator.of(context).pushNamed("/invoice");
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: const Text(
                                    "PAY INVOICE",
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                              const SizedBox(height: kDefaultPadding),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 2, // thickness
                                            color: Colors.white // color
                                            ),
                                        // border radius
                                        borderRadius:
                                            BorderRadius.circular(16))),
                                onPressed: () {
                                  selectedIndex = 5;
                                  Obx(scrollcontroller.scrollToSmallScreen(
                                      context, selectedIndex));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: const Text(
                                    "CONTACT US",
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: kDefaultPadding),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 1.5),
                          child: Container(
                            height: 100,
                            width: 100,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 10),
                                  blurRadius: 50,
                                  color: theme.brightness == Brightness.light
                                      ? kPitchDark.withOpacity(.9)
                                      : whitebackgroundColor.withOpacity(.9),
                                ),
                              ],
                              image: const DecorationImage(
                                  image: AssetImage(starsTogether)),
                            ),
                          ),
                        ),
                        const SizedBox(height: kDefaultPadding * .5),
                        const SizedBox(height: kDefaultPadding),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: List.generate(
                        menuItems.length,
                        (i) => MouseRegion(
                          child: DrawerButton(
                            text: menuItems[i].toUpperCase(),
                            pressed: () => scrollcontroller.scrollToSmallScreen(
                                context, i),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SmallSocialCard(
                        iconSrc: iconPicWhatsApp,
                        color: const Color(0xFFE4FFC7),
                        size: 25,
                        press: () => launchURLs(whatsAppLink),
                      ),
                      const SizedBox(width: kDefaultPadding),
                      SmallSocialCard(
                        iconSrc: iconPicTwitter,
                        color: const Color(0xFFE8F0F9),
                        size: 25,
                        press: () => launchURLs(twitterLink),
                      ),
                      const SizedBox(width: kDefaultPadding),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ResponsiveWidget.isSmallScreen(context)
              ? TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: value),
                  duration: drawerAnimationDuration,
                  curve: drawerAnimationCurve,
                  builder: (context, double v, __) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, .001)
                        ..setEntry(0, 3, 200 * v)
                        ..rotateY((pi / 6) * v),
                      child: GestureDetector(
                        onHorizontalDragUpdate: (e) {
                          if (e.delta.dx > 0) {
                            setState(() {
                              value = 1;
                            });
                          } else {
                            setState(() {
                              value = 0;
                            });
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: widget.child,
                        ),
                      ),
                    );
                  },
                )
              : widget.child,
          
        ],
      ),
    );
  }
}
