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
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      padding: EdgeInsets.symmetric(
          horizontal: ResponsiveWidget.isLargeScreen(context)
              ? kDefaultPadding * 10
              : kDefaultPadding * 1.5),
      child: Column(
        children: [
          SizedBox(height: kDefaultPadding * 2),
          ResponsiveWidget.isLargeScreen(context)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('About',
                            style: theme.textTheme.headline2!
                                .copyWith(fontWeight: FontWeight.w900)),
                        SizedBox(height: 25),
                        Image.asset(
                            theme.brightness == Brightness.light
                                ? star2
                                : star2,
                            width: 100),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(child: AboutSectionText(text: aboutMeTexta)),
                    SizedBox(
                      width: 20,
                    ),
                    ExperienceCountCard(expNum: '10'),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(child: AboutSectionText(text: aboutMeTextb)),
                  ],
                )
              : Container(
                  height: _.height * 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(star2, width: 65),
                              SizedBox(width: 10),
                              Text('About',
                                  style: theme.textTheme.headline2!
                                      .copyWith(fontWeight: FontWeight.w900)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: kDefaultPadding),
                      Expanded(
                        child: AboutSectionText(text: aboutMeTexta),
                      ),
                      ExperienceCountCard(expNum: '10'),
                      SizedBox(height: kDefaultPadding * 3.5),
                      Expanded(
                        child: AboutSectionText(text: aboutMeTextb),
                      ),
                    ],
                  ),
                ),
          SizedBox(height: kDefaultPadding / 5),
          SizedBox(height: 70),
          ResponsiveWidget.isLargeScreen(context)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AnOutlinedButton(
                      width: 200,
                      text: 'Hire Us',
                      imageSrc: hireUs,
                      press: () => launchEmailUrl(),
                    ),
                    SizedBox(width: kDefaultPadding * 1 * 4),
                    ATextButton(
                      width: 250,
                      text: 'Our Past Work',
                      imageSrc: ourWork,
                      press: () {
                        selectedIndex = 3;
                        Obx(scrollcontroller.scrollTo(context, selectedIndex));
                      },
                    ),
                    SizedBox(width: kDefaultPadding * 1 * 5),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnOutlinedButton(
                      width: 175,
                      text: 'Hire Us',
                      imageSrc: hireUs,
                      press: () => launchEmailUrl(),
                    ),
                    SizedBox(width: kDefaultPadding * .4),
                    ATextButton(
                      width: 175,
                      text: 'Our Past Work',
                      imageSrc: ourWork,
                      press: () {}, //TODO: CV url
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
