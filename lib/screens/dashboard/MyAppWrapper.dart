import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../languages/LanguagesScreen.dart';
import 'HomeScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class MyAppWrapper extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    final _MyAppWrapperState? state = context.findAncestorStateOfType<_MyAppWrapperState>();
    state?.setLocale(newLocale);
  }

  @override
  State<MyAppWrapper> createState() => _MyAppWrapperState();
}

class _MyAppWrapperState extends State<MyAppWrapper> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HRMS App',
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('mr'),
       /* Locale('de'),
        Locale('es'),
        Locale('fr'),
        Locale('ar'),
        Locale('pt', 'BR'),
        Locale('zh'),*/
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: LanguagesScreen(), // Replace with your actual initial screen
    );
  }
}
