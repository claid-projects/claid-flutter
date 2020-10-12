import 'package:claidflutter/components/language.dart';
import 'package:claidflutter/main.dart';
import 'package:flutter/material.dart';
// import 'package:claidflutter/pages/Login/login_page.dart';
import 'package:claidflutter/pages/Signup/signup_page.dart';
import 'package:claidflutter/pages/Welcome/background.dart';
import 'package:claidflutter/components/rounded_button.dart';
import 'package:claidflutter/constants.dart';
import 'package:claidflutter/pages/main/main_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:claidflutter/localization/demo_localization.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void _changeLanguage(Language language) {
    Locale _temp;
    switch (language.languageCode) {
      case 'fa':
        _temp = Locale(language.languageCode, 'IR');
        break;
      case 'en':
        _temp = Locale(language.languageCode, 'US');
        break;
      default:
        _temp = Locale(language.languageCode, 'IR');
    }
    MyApp.setLocate(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
                alignment: Alignment.topRight,
                child: DropdownButton(
                  onChanged: (Language language) {
                    _changeLanguage(language);
                  },
                  underline: SizedBox(),
                  icon: Icon(
                    Icons.language,
                    color: Colors.blue,
                    size: 36.0,
                  ),
                  items: Language.languageList()
                      .map<DropdownMenuItem<Language>>(
                          (lang) => DropdownMenuItem(
                              value: lang,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(lang.flag),
                                  Text(
                                    lang.name,
                                    style: TextStyle(fontSize: 30),
                                  ),
                                ],
                              )))
                      .toList(),
                )),
            Text(
              DemoLocalizations.of(context).getTranslatedValue('welcome'),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: DemoLocalizations.of(context).getTranslatedValue('login'),
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MainPage();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: DemoLocalizations.of(context).getTranslatedValue('sign up'),
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
