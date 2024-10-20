import 'package:auto_animated/auto_animated.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:arbiter_pm/views/sections/about_section.dart';
import 'package:arbiter_pm/views/sections/contact_section.dart';
import 'package:arbiter_pm/views/sections/feedback_section.dart';
import 'package:arbiter_pm/views/sections/landing_section.dart';
import 'package:arbiter_pm/views/sections/recentwork_section.dart';
import 'package:arbiter_pm/views/sections/service_section.dart';
import 'package:arbiter_pm/widgets/landing_carousel.dart';

import '../controllers/scrolling_controller.dart';
import '../widgets/bottom_section.dart';
import '../widgets/mouse_magnet.dart';
import '../widgets/portfolio_drawer.dart';

class HomeView extends GetView<ScrollingController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);

    FirebaseAnalytics.instance.logAppOpen();
    FirebaseAnalytics.instance.logEvent(name: 'load_home_page');

    return SizedBox(
      height: size.height,
      width: size.width,
      child: PortfolioDrawer(
        child: Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: MouseMagnet(
            body: CustomScrollView(
              controller: controller.scrollingController,
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  expandedHeight: 650,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        Column(
                          children: [
                            const LandingCarousel(),
                            Container(
                              color: theme.scaffoldBackgroundColor,
                              width: double.infinity,
                              height: 50,
                            ),
                          ],
                        ),
                        const Align(
                          alignment: Alignment.center,
                          child: LandingSect(),
                        ),
                      ],
                    ),
                    titlePadding: const EdgeInsets.symmetric(
                      horizontal: 44,
                      vertical: 33,
                    ),
                  ),
                  titleSpacing: 0.0,
                  elevation: 7,
                  leadingWidth: 0.0,
                ),
                LiveSliverList(
                  controller: controller.scrollingController,
                  itemCount: _sections.length,
                  visibleFraction: 0.05,
                  itemBuilder: (context, i, animation) {
                    return FadeTransition(
                      opacity: CurvedAnimation(
                        parent: animation,
                        curve: Curves.ease,
                      ),
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, .3),
                          end: Offset.zero,
                        ).animate(animation),
                        child: _sections[i],
                      ),
                    );
                  },
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (builder, x) => _sectsBottom[x],
                    childCount: _sectsBottom.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static final List<Widget> _sections = [
    const AboutSection(),
    const ServiceSection(),
    const RecentWorkSection(),
    const FeedBackSection(),
  ];

  static final List<Widget> _sectsBottom = [
    const ContactSection(),
    const BottomSection(),
  ];
}
