import 'package:get_it/get_it.dart';
import 'package:RCD/models/config.dart';

class AppLocalization {
  AppLocalization._();

  static Localization fromLocaleId(String id) {
    return values.firstWhere(
      (locale) => locale.id == id,
      orElse: () => fallback,
    );
  }

  static const en = _LocalizationEn();

  static const fallback = en;

  static const values = <Localization>[
    en,
  ];

  static Localization get instance => GetIt.instance<Config>().localization;
}

abstract class Localization {
  const Localization();

  String get id;
  String get name;
  String get fallbackName;
  String get icon;
  String get title => 'RonanChance';
  String get about => 'About';
  String get firstName => 'Ronan';
  String get lastName => 'Donovan';
  String get nickName => 'Ronan';
  String get commonName => nickName;
  String get greetingMorning => 'Hi,';
  String get greetingAfternoon => 'Hi,';
  String get greetingEvening => 'Hi, ';
  String get introductionPrefix => "I'm ";
  String get introductionSuffix => '.';

  String get highlightSoftwareDeveloperTitle => 'Software Developer';
  String get highlightSoftwareDeveloperDescription => 'Python, C/C++, Java';

  String get highlightOpenSourceContributorTitle => 'William and Mary';
  String get highlightOpenSourceContributorDescription => 'Computer Science Student';

  String get highlightSpeakerTitle => 'My Future';
  String get highlightSpeakerDescription => 'Building Data Driven Applications';

  String get businessInfo => 'RonanChance.com ・ Williamsburg, VA';

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(dynamic other) => identical(this, other) || other is Localization && id == other.id;
}

class _LocalizationEn extends Localization {
  const _LocalizationEn();

  @override
  String get id => 'en';
  @override
  String get name => 'English (US)';
  @override
  String get fallbackName => name;
  @override
  String get icon => '🇺🇸';
}
