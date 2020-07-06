import 'package:flutter/material.dart';
import 'package:RCD/theme.dart';
import 'package:RCD/ux/sections/welcome/welcome_section.dart';
import 'package:RCD/ux/sections/about/about_me.dart';

class MainContainer extends StatefulWidget {
  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  AnimationController _overlayAnimation;
  Animation<double> _languageSwitcherAnimation;

  @override
  void initState() {
    super.initState();
    _overlayAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..forward();
    _languageSwitcherAnimation = CurvedAnimation(
      parent: _overlayAnimation,
      curve: const Interval(0.65, 1.0, curve: AppTheme.animationCurveDefault),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          // physics: const NeverScrollableScrollPhysics(),
          children: const <Widget>[
            WelcomeSection(showDownArrow: true),
            AboutMeSection(),
            // AboutSection(),
          ],
        ),
        Positioned(
          top: 10.0,
          left: 10.0,
          child: AnimatedBuilder(
            animation: _overlayAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _languageSwitcherAnimation.value,
                child: child,
              );
            },
          ),
        ),
      ],
    );
  }
}
