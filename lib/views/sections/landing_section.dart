import 'package:flutter/material.dart' hide MenuBar;

import '../../../../widgets/glass_content.dart';
import '../../../../widgets/logo.dart';
import '../../constants/constants.dart';
import '../../widgets/menu_bar.dart';
import '../../widgets/person_pic.dart';
import '../../widgets/responsive_widget.dart';
import '../../widgets/toggle_theme_button.dart';

class LandingSect extends StatelessWidget {
  const LandingSect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _ = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: kDefaultPadding * 1.5),
      width: _.width * .9,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      left: ResponsiveWidget.isSmallScreen(context)
                          ? kDefaultPadding * 2
                          : 1),
                  child: const LoGo()),
              const Spacer(),
              const GlassContent(),
              const Spacer(flex: 2),
            ],
          ),
          ResponsiveWidget.isSmallScreen(context)
              ? const SizedBox()
              : Positioned(
                  bottom: 90,
                  right: -25,
                  child: PersonPic(
                      height:
                          ResponsiveWidget.isSmallScreen(context) ? 450 : 550),
                ),
          Positioned(
            bottom: 49,
            child: ResponsiveWidget.isSmallScreen(context)
                ? const SizedBox()
                : const MenuBar(),
          ),
          ResponsiveWidget.isSmallScreen(context)
              ? const SizedBox()
              : const Positioned(
                  right: 0,
                  top: 0,
                  child: SizedBox(
                    height: 50,
                    child: ThemeToggleButton(),
                  ),
                )
        ],
      ),
    );
  }
}
