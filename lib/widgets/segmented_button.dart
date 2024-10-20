import 'dart:math';
import 'package:arbiter_pm/constants/colors.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../constants/text_styles.dart';
import '../models/service_model.dart';
import 'responsive_widget.dart';

class SegmentedButtonWithAnimatedContainer extends StatefulWidget {
  const SegmentedButtonWithAnimatedContainer();

  @override
  _SegmentedButtonWithAnimatedContainerState createState() =>
      _SegmentedButtonWithAnimatedContainerState();
}

class _SegmentedButtonWithAnimatedContainerState
    extends State<SegmentedButtonWithAnimatedContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  double rotationx = 0;
  double rotationy = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _animation = Tween<double>(begin: 0, end: 300).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ResponsiveWidget.isLargeScreen(context)
        ? Column(
            children: <Widget>[
              SizedBox(
                height: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(services.length, (service) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          serviceIndex = service;
                          _controller.forward();
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ResponsiveWidget.isLargeScreen(context)
                                ? 0
                                : kDefaultPadding),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              serviceIndex = service;
                            });
                          },
                          onHover: (v) {},
                          radius: 50,
                          hoverColor: Colors.transparent,
                          child: AnimatedContainer(
                            duration: hoverAnimationDuration,
                            width: 256,
                            height: 226,
                            margin: const EdgeInsets.symmetric(
                                vertical: kDefaultPadding * 2),
                            decoration: BoxDecoration(
                              color: services[service].color,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 10),
                                  blurRadius: 50,
                                  color: theme.brightness == Brightness.light
                                      ? kPitchDark.withOpacity(.2)
                                      : whitebackgroundColor.withOpacity(.2),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AnimatedContainer(
                                  duration: hoverAnimationDuration,
                                  width: 120,
                                  height: 120,
                                  padding: const EdgeInsets.all(
                                      kDefaultPadding * 1.5),
                                  decoration: BoxDecoration(
                                    color: theme.brightness == Brightness.light
                                        ? whitebackgroundColor
                                        : const Color.fromARGB(
                                            255, 188, 198, 219),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 20),
                                        blurRadius: 30,
                                        color: Colors.black.withOpacity(.3),
                                      )
                                    ],
                                  ),
                                  child: Image.asset(
                                    services[service].image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(height: kDefaultPadding),
                                Text(
                                  services[service].title,
                                  style: servicecardTextStyle,
                                ),
                                (serviceIndex != service)
                                    ? const SizedBox(height: 5)
                                    : AnimatedContainer(
                                        curve: Curves.fastOutSlowIn,
                                        width: (service == serviceIndex)
                                            ? double.infinity
                                            : 0,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 40),
                                        height: 5,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                offset: const Offset(2, 3),
                                                blurRadius: 5,
                                                color: Colors.black
                                                    .withOpacity(.2),
                                              )
                                            ],
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                            color: Colors.red),
                                      )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 200,
                child: AnimatedContainer(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        transform: GradientRotation(2 * pi / 3 * 2),
                        colors: [russianViolet, platinum, textColorDarkTheme]),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  height: _animation.value,
                  width: double.infinity,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: ResponsiveWidget.isLargeScreen(context)
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: List.generate(
                          services[serviceIndex].description.length,
                          (serviceDescription) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            services[serviceIndex]
                                .description[serviceDescription],
                            maxLines: 10,
                            style:
                                const TextStyle(color: kDarker, fontSize: 35),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              )
            ],
          )
        : Column(
            children: <Widget>[
              SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(services.length, (service) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            serviceIndex = service;
                            _controller.forward();
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  ResponsiveWidget.isLargeScreen(context)
                                      ? 0
                                      : kDefaultPadding),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                serviceIndex = service;
                              });
                            },
                            onHover: (v) {},
                            radius: 50,
                            hoverColor: Colors.transparent,
                            child: AnimatedContainer(
                              duration: hoverAnimationDuration,
                              width: 256,
                              height: 226,
                              margin: const EdgeInsets.symmetric(
                                  vertical: kDefaultPadding * 2),
                              decoration: BoxDecoration(
                                color: services[service].color,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 10),
                                    blurRadius: 50,
                                    color: theme.brightness == Brightness.light
                                        ? kPitchDark.withOpacity(.2)
                                        : whitebackgroundColor.withOpacity(.2),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AnimatedContainer(
                                    duration: hoverAnimationDuration,
                                    width: 120,
                                    height: 120,
                                    padding: const EdgeInsets.all(
                                        kDefaultPadding * 1.5),
                                    decoration: BoxDecoration(
                                      color:
                                          theme.brightness == Brightness.light
                                              ? whitebackgroundColor
                                              : const Color.fromARGB(
                                                  255, 188, 198, 219),
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 20),
                                          blurRadius: 30,
                                          color: Colors.black.withOpacity(.3),
                                        )
                                      ],
                                    ),
                                    child: Image.asset(
                                      services[service].image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(height: kDefaultPadding),
                                  Text(
                                    services[service].title,
                                    style: servicecardTextStyle,
                                  ),
                                  (serviceIndex != service)
                                      ? const SizedBox(height: 5)
                                      : Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 40),
                                          height: 5,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: const Offset(2, 3),
                                                  blurRadius: 5,
                                                  color: Colors.black
                                                      .withOpacity(.2),
                                                )
                                              ],
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                              color: Colors.red),
                                        )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: AnimatedContainer(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        transform: GradientRotation(2 * pi / 3 * 2),
                        colors: [russianViolet, platinum, textColorDarkTheme]),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  height: _animation.value,
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          services[serviceIndex].description.length,
                          (serviceDescription) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            services[serviceIndex]
                                .description[serviceDescription],
                            style: const TextStyle(
                                color: kDarker,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              )
            ],
          );
  }
}
