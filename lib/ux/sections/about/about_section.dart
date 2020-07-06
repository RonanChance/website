import 'package:flutter/material.dart';
import 'package:RCD/theme.dart';
import 'package:RCD/ux/widgets/fill_screen.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const FillScreen(
      gradient: AppTheme.gradientDefault,
      child: Center(
        child: Text('About'),
      ),
    );
  }
}
