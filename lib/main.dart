import 'package:claidflutter/localization/demo_localization.dart';
import 'package:flutter/material.dart';
import 'package:claidflutter/pages/Welcome/welcome_page.dart';
import 'package:claidflutter/constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static void setLocate(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      locale: _locale,
      supportedLocales: [
        const Locale('fa', 'IR'),
        const Locale('en', 'US'),
      ],
      localizationsDelegates: [
        DemoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale.languageCode &&
              locale.countryCode == deviceLocale.countryCode) {
            return deviceLocale;
          }
        }
        return supportedLocales.first;
      },
      home: WelcomeScreen(),
    );
  }
}
