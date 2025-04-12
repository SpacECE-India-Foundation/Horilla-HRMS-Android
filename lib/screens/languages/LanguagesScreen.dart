import 'package:flutter/material.dart';


import '../../models/languages/Languages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../dashboard/MyAppWrapper.dart'; // Add this import

class LanguagesScreen extends StatefulWidget {
  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  Locale? selectedLocale;

  final List<Languages> languages = [
    Languages(language: 'English (US)', image: 'assets/flags/us.png', locale: const Locale('en')),
    Languages(language: 'Deutsch', image: 'assets/flags/de.png', locale: const Locale('de')),
    Languages(language: 'Español', image: 'assets/flags/es.png', locale: const Locale('es')),
    Languages(language: 'Français', image: 'assets/flags/fr.png', locale: const Locale('fr')),
    Languages(language: 'عربى', image: 'assets/flags/ar.png', locale: const Locale('ar')),
    Languages(language: 'Português (Brasil)', image: 'assets/flags/br.png', locale: const Locale('pt', 'BR')),
    Languages(language: '中文简体', image: 'assets/flags/zh.png', locale: const Locale('zh')),
    Languages(language: 'मराठी', image: 'assets/flags/in.png', locale: const Locale('mr')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.appTitle ?? 'HRMS App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              AppLocalizations.of(context)?.chooseLanguage ?? 'Choose your language',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Language List
          Expanded(
            child: ListView.builder(
              itemCount: languages.length,
              itemBuilder: (context, index) {
                final language = languages[index];
                final isSelected = selectedLocale == language.locale;

                return ListTile(
                  leading: Image.asset(language.image, width: 32),
                  title: Text(language.language),
                  trailing: isSelected ? const Icon(Icons.check, color: Colors.orange) : null,
                  onTap: () {
                    setState(() {
                      selectedLocale = language.locale;
                    });
                    // Change app locale
                    MyAppWrapper.setLocale(context, language.locale);
                  },
                  selected: isSelected,
                  selectedTileColor: Colors.orange.withOpacity(0.1),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

