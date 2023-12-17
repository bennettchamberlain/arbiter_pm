import 'package:arbiter_pm/constants/constants.dart';
import 'package:arbiter_pm/models/service_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/scrolling_controller.dart';
import '../../widgets/responsive_widget.dart';
import '../../widgets/section_title.dart';
import '../../widgets/segmented_button.dart';
import '../../widgets/service_card.dart';

class ServiceSection extends GetView<ScrollingController> {
  const ServiceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: BoxConstraints(maxWidth: 1000),
      child: Column(
        children: [
          SectionTitle(
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
                  child: SegmentedButtonWithAnimatedContainer())
              : 
                   SegmentedButtonWithAnimatedContainer(),
          SizedBox(height: kDefaultPadding * 2),
        ],
      ),
    );
  }
}
