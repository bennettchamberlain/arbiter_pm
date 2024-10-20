import 'package:arbiter_pm/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/scrolling_controller.dart';
import '../../widgets/responsive_widget.dart';
import '../../widgets/section_title.dart';
import '../../widgets/segmented_button.dart';

class ServiceSection extends GetView<ScrollingController> {
  const ServiceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: const BoxConstraints(maxWidth: 1000),
      child: Column(
        children: [
          const SectionTitle(
            title: 'Our Expertise',
            subTitle: 'Service Offerings',
            color: Color(0xFFb375fe),
          ),
          ResponsiveWidget.isLargeScreen(context)
              ? Padding(
                  padding: EdgeInsets.only(
                    right: ResponsiveWidget.isLargeScreen(context)
                        ? kDefaultPadding * 5
                        : kDefaultPadding * 2,
                    left: ResponsiveWidget.isLargeScreen(context)
                        ? kDefaultPadding * 5
                        : kDefaultPadding * 2,
                    bottom: kDefaultPadding * 5,
                  ),
                  child: const SegmentedButtonWithAnimatedContainer())
              : const SegmentedButtonWithAnimatedContainer(),
          const SizedBox(height: kDefaultPadding * 2),
        ],
      ),
    );
  }
}
