import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:RCD/app_localization.dart';
import 'package:RCD/models/config.dart';
import 'package:RCD/theme.dart';
import 'package:RCD/ux/containers/main/main_container.dart';

Future<void> main() async {
  final config = await Config.parseYaml('config.yaml');

  runApp(RCDApp(config: config));
}

class RCDApp extends StatelessWidget {
  RCDApp({Config config}) {
    GetIt.instance.registerSingleton<Config>(config);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppLocalization.instance.title,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(),
      home: Scaffold(
        body: MainContainer(),
      ),
    );
  }
}
