import 'package:arbiter_pm/constants/constants.dart';
import 'package:arbiter_pm/widgets/section_title.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/image_paths.dart';
import '../../models/recentwork_model.dart';
import '../../widgets/hireme_card.dart';
import '../../widgets/recent_work_dialog.dart';
import '../../widgets/recentwork_card.dart';
import '../../widgets/responsive_widget.dart';

class RecentWorkSection extends StatelessWidget {
  const RecentWorkSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.light
            ? const Color(0xFFF7E8FF)
            : bgColorDarkTheme,
        image: const DecorationImage(fit: BoxFit.cover, image: AssetImage(bg_img1)),
      ),
      child: Column(
        children: [
          Transform.translate(
            offset: const Offset(0, -50),
            child: const HireMeCard(),
          ),
          SectionTitle(
            title: ResponsiveWidget.isLargeScreen(context)
                ? 'Client Success Showcase'
                : "Our Clients",
            subTitle: 'Portfolio Highlights',
            color: const Color(0xFFFFB100),
          ),
          const SizedBox(height: kDefaultPadding * 1.5),
          SizedBox(
            width: 1110,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: kDefaultPadding,
              runSpacing: ResponsiveWidget.isLargeScreen(context)
                  ? kDefaultPadding * 2
                  : kDefaultPadding,
              children: List.generate(
                recentWorks.length,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveWidget.isLargeScreen(context)
                          ? 0
                          : kDefaultPadding),
                  child: RecentWorkCard(
                    index: index,
                    press: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return RecentWorkDialog(index: index);
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding * 3),
        ],
      ),
    );
  }
}
