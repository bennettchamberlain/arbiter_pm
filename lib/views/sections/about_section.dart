import 'package:flutter/material.dart';
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
              ? kDefaultPadding * 10
              : kDefaultPadding * 1.5),
      child: Column(
        children: [
          const SizedBox(height: kDefaultPadding * 2),
          ResponsiveWidget.isLargeScreen(context)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('About',
                            style: theme.textTheme.displayMedium!
                                .copyWith(fontWeight: FontWeight.w900)),
                        const SizedBox(height: 15),
                        Image.asset(
                            theme.brightness == Brightness.light
                                ? starsTogether
                                : starsTogether,
                            width: 100),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Expanded(child: AboutSectionText(text: aboutMeTexta)),
                    const SizedBox(
                      width: 20,
                    ),
                    const ExperienceCountCard(expNum: '10'),
                    const SizedBox(
                      width: 20,
                    ),
                    const Expanded(child: AboutSectionText(text: aboutMeTextb)),
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
                                      width: kDefaultPadding * 4,
                                    )
                                  : const SizedBox(width: kDefaultPadding * 2),
                              Image.asset(starsTogether, width: 65),
                              const SizedBox(width: 10),
                              Text('About',
                                  style: theme.textTheme.displayMedium!
                                      .copyWith(fontWeight: FontWeight.w900)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: kDefaultPadding),
                      const AboutSectionText(text: aboutMeTexta),
                      ResponsiveWidget.isSmallScreen(context)
                          ? const SizedBox(height: 50)
                          : const SizedBox(height: 0),
                      const ExperienceCountCard(expNum: '10'),
                      const SizedBox(height: kDefaultPadding * 3.5),
                      const AboutSectionText(text: aboutMeTextb),
                    ],
                  ),
                ),
          const SizedBox(height: kDefaultPadding / 5),
          const SizedBox(height: 70),
          ResponsiveWidget.isLargeScreen(context)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: kDefaultPadding * 3),
                    AnOutlinedButton(
                      width: 210,
                      text: 'Contact Us',
                      imageSrc: hireUs,
                      press: () {
                        selectedIndex = 5;

                        Obx(scrollcontroller.scrollTo(context, selectedIndex));
                      },
                    ),
                    const SizedBox(width: kDefaultPadding * 1 * 4),
                    ATextButton(
                      width: 220,
                      text: 'Past Work',
                      imageSrc: ourWork,
                      press: () {
                        selectedIndex = 3;
                        Obx(scrollcontroller.scrollTo(context, selectedIndex));
                      },
                    ),
                    const SizedBox(width: kDefaultPadding * 1 * 4),
                  ],
                )
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
                            scrollcontroller.scrollTo(context, selectedIndex),
                          );
                        }),
                    const SizedBox(height: kDefaultPadding),
                    ATextButton(
                      width: 220,
                      text: 'Our Past Work',
                      imageSrc: ourWork,
                      press: () {
                        selectedIndex = 4;
                        Obx(
                          scrollcontroller.scrollTo(context, selectedIndex),
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
