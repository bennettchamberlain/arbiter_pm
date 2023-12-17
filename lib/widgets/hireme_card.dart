import 'package:arbiter_pm/constants/constants.dart';
import 'package:arbiter_pm/widgets/a_text_button.dart';
import 'package:arbiter_pm/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/image_paths.dart';
import '../controllers/scrolling_controller.dart';

class HireMeCard extends StatelessWidget {
  const HireMeCard({
    Key? key,
  }) : super(key: key);

  static var scrollcontroller = Get.find<ScrollingController>();

  @override
  Widget build(BuildContext context) {
    final Size _ = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(ResponsiveWidget.isSmallScreen(context)
          ? kDefaultPadding * 1.5
          : kDefaultPadding * 2),
      margin: EdgeInsets.only(bottom: kDefaultPadding),
      constraints: BoxConstraints(
          maxWidth: ResponsiveWidget.isSmallScreen(context)
              ? _.width * .9
              : _.width * .8),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 50,
            color: theme.brightness == Brightness.light
                ? kPitchDark.withOpacity(.1)
                : whitebackgroundColor.withOpacity(.1),
          ),
        ],
      ),
      child: ResponsiveWidget.isLargeScreen(context)
          ? Row(
              children: [
                ResponsiveWidget.isLargeScreen(context)
                    ? Image.asset(
                        emailIcon,
                        height: 80,
                        width: 80,
                      )
                    : SizedBox(),
                ResponsiveWidget.isLargeScreen(context)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        child: SizedBox(
                          height: 80,
                          child: VerticalDivider(),
                        ),
                      )
                    : SizedBox(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ResponsiveWidget.isSmallScreen(context)
                            ? 'Hiring?'
                            : 'Are you hiring?',
                        style: TextStyle(
                          fontFamily: 'Helvetica Now Display',
                          fontWeight: FontWeight.w700,
                          fontSize:
                              ResponsiveWidget.isSmallScreen(context) ? 35 : 45,
                          letterSpacing: -.7,
                          color: theme.brightness == Brightness.light
                              ? kPitchDark
                              : bodyTextColorDarkTheme,
                        ),
                      ),
                      SizedBox(height: kDefaultPadding * .5),
                      Text(
                        'Add Arbiter to your team.',
                        style: theme.textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 55,
                  child: Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: ATextButton(
                      width:
                          ResponsiveWidget.isSmallScreen(context) ? 180 : 200,
                      imageSrc: hireUsBlk,
                      text: 'Contact Us',
                      press: () {
                        selectedIndex = 5;
                        Obx(scrollcontroller.scrollTo(context, selectedIndex));
                      },
                    ),
                  ),
                ),
              ],
            )
          : Row(
              children: [
                ResponsiveWidget.isLargeScreen(context)
                    ? Image.asset(
                        emailIcon,
                        height: 80,
                        width: 80,
                      )
                    : SizedBox(),
                ResponsiveWidget.isLargeScreen(context)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        child: SizedBox(
                          height: 80,
                          child: VerticalDivider(),
                        ),
                      )
                    : SizedBox(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ResponsiveWidget.isSmallScreen(context)
                            ? 'Hiring?'
                            : 'Are you hiring?',
                        style: TextStyle(
                          fontFamily: 'Helvetica Now Display',
                          fontWeight: FontWeight.w700,
                          fontSize:
                              ResponsiveWidget.isSmallScreen(context) ? 35 : 45,
                          letterSpacing: -.7,
                          color: theme.brightness == Brightness.light
                              ? kPitchDark
                              : bodyTextColorDarkTheme,
                        ),
                      ),
                      SizedBox(height: kDefaultPadding * .5),
                      Text(
                        'Add Arbiter to your team.',
                        style: theme.textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          letterSpacing: 1.5,
                        ),
                      ),
                      SizedBox(
                        height: 55,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: ATextButton(
                            width: ResponsiveWidget.isSmallScreen(context)
                                ? 180
                                : 200,
                            imageSrc: hireUsBlk,
                            text: 'Contact Us',
                            press: () {
                              selectedIndex = 5;
                              Obx(scrollcontroller.scrollTo(
                                  context, selectedIndex));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
