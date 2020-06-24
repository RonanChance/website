import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jfkdev/theme.dart';
import 'package:jfkdev/ux/app_icons.dart';
import 'package:jfkdev/ux/widgets/fill_screen.dart';
import 'package:jfkdev/ux/widgets/widget_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../theme.dart';
import '../../app_icons.dart';

class AboutMeSection extends StatefulWidget {
  const AboutMeSection({
    Key key,
    this.showDownArrow = true,
  }) : super(key: key);

  final bool showDownArrow;

  @override
  _AboutMeState createState() => _AboutMeState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('showDownArrow', showDownArrow));
  }
}

class _AboutMeState extends State<AboutMeSection>
    with SingleTickerProviderStateMixin {
  AnimationController _baseAnimation;

  @override
  void initState() {
    super.initState();
    _baseAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FillScreen(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              // verticalMargin32,
              Container(
                margin: const EdgeInsets.only(
                    top: 50, bottom: 40, left: 300, right: 300),
                decoration: const BoxDecoration(color: Colors.transparent),
                child: const Text(
                  'Recent Projects & Interests',
                  style: TextStyle(
                      fontFamily: AppTheme.fontFamilyDefault,
                      color: AppTheme.colorTextPrimary,
                      fontSize: 35),
                ),
              ),
              InkWell(
                onTap: () {
                  launch('https://github.com/RonanChance/website');
                },
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 300, right: 300),
                  child: _buildProjectInfo(
                      name: 'This Website!',
                      description:
                          'I built this website using a beta version of Flutter web in the dart programming language.',
                      image: 'web.png'),
                ),
              ),
              InkWell(
                onTap: () {
                  launch(
                      'https://github.com/RonanChance/competitive-programming');
                },
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 300, right: 300),
                  child: _buildProjectInfo(
                      name: 'Competitive Programming',
                      description:
                          '* We hold weekly Kattis programming competitions at W&M. \n* Competed at ICPC with my team. \n* I post my solutions on GitHub - feel free to check them out!',
                      image: 'code.png'),
                ),
              ),
              InkWell(
                onTap: () {
                  launch('https://github.com/RonanChance/LifeStack');
                },
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 300, right: 300),
                  child: _buildProjectInfo(
                      name: 'LifeStack',
                      description:
                          'My team won the best blockchain implementation at Hoya Hacks 2019!',
                      image: 'lifestack.png'),
                ),
              ),
              // _buildExperienceRow(
              //     company: 'College of William and Mary',
              //     position: 'B.Sc. Computer Science',
              //     duration: '2019 - 2023'),
              // _buildExperienceRow(
              //     company: 'Walsingham Academy',
              //     position: '',
              //     duration: '2017 - 2019'),
              // _buildExperienceRow(
              //     company: 'Jakarta Intercultural School',
              //     position: '',
              //     duration: '2015 - 2017'),
              // const Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildProjectInfo({String name, String description, String image}) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/images/' + image),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.colorTextPrimary,
                      ),
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        color: AppTheme.colorTextSecondary,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )));
  }
}
