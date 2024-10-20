import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../constants/image_paths.dart';
import '../../constants/text_logs.dart';
import '../../controllers/scrolling_controller.dart';
import '../../widgets/aboutsection_text.dart';
import '../../widgets/an_outlined_button.dart';
import '../../widgets/experience_count_card.dart';
import '../../widgets/a_text_button.dart';
import '../../constants/constants.dart';
import '../../widgets/responsive_widget.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  static var scrollcontroller = Get.find<ScrollingController>();

  @override
  Widget build(BuildContext context) {
    final Size _ = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);

    return Container(
      clipBehavior: Clip.none,
      constraints: BoxConstraints(
        maxWidth: _.width * .8,
      ),
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      padding: EdgeInsets.symmetric(
          horizontal: ResponsiveWidget.isLargeScreen(context)
              ? kDefaultPadding * 8
              : kDefaultPadding * 1.5),
      child: Column(
        children: [
          const SizedBox(height: kDefaultPadding * 2),
          ResponsiveWidget.isLargeScreen(context)
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Relationship Oriented\nResults Driven',
                            style: theme.textTheme.displayMedium!.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 32,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const ExperienceCountCard(expNum: '10'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AboutSectionText(text: aboutMeTexta),
                          const SizedBox(height: 30),
                          AboutSectionText(text: aboutMeTextb),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AnOutlinedButton(
                                width: 200,
                                text: 'Contact Us',
                                imageSrc: hireUs,
                                press: () {
                                  selectedIndex = 5;
                                  scrollcontroller.scrollTo(
                                      context, selectedIndex);
                                },
                              ),
                              const SizedBox(width: kDefaultPadding),
                              ATextButton(
                                width: 200,
                                text: 'Past Work',
                                imageSrc: ourWork,
                                press: () {
                                  selectedIndex = 3;
                                  scrollcontroller.scrollTo(
                                      context, selectedIndex);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : SizedBox(
                  height: _.height * 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              ResponsiveWidget.isLargeScreen(context)
                                  ? const SizedBox(
                                      width: kDefaultPadding,
                                    )
                                  : const SizedBox(width: kDefaultPadding),
                              Text('Relationship Oriented, \nResults Driven',
                                  style: theme.textTheme.displaySmall!.copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w900)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const AboutSectionText(text: aboutMeTexta),
                      const SizedBox(height: 20),
                      const ExperienceCountCard(expNum: '10'),
                      const SizedBox(height: 20),
                      const AboutSectionText(text: aboutMeTextb),
                    ],
                  ),
                ),
          const SizedBox(height: kDefaultPadding / 5),
          const SizedBox(height: 40), //this one
          ResponsiveWidget.isLargeScreen(context)
              ? SizedBox(height: 0)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnOutlinedButton(
                        width: 220,
                        text: 'Contact Us',
                        imageSrc: hireUs,
                        press: () {
                          selectedIndex = 5;
                          Obx(
                            scrollcontroller.scrollToSmallScreen(
                                context, selectedIndex),
                          );
                        }),
                    const SizedBox(height: kDefaultPadding),
                    ATextButton(
                      width: 220,
                      text: 'Our Past Work',
                      imageSrc: ourWork,
                      press: () {
                        selectedIndex = 3;
                        Obx(
                          scrollcontroller.scrollToSmallScreen(
                              context, selectedIndex),
                        );
                      }, //TODO: CV url
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
