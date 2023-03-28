import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

String getDeviceLocale() {
  return window.locale.languageCode;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    getDeviceLocale();
    debugPrint(window.locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // TODO: How to pass in the localized string into the application title
      // onGenerateTitle: (context) => DemoLocalizations.of(context).title,

      title: 'flutter Internationalisation Demo',
      // LocalizationsDelegates defines a list of delegates that Flutter will
      // use to look up localised strings and other resources for the app.

      // Once the codegen generates the gen_l10 folder, The AppLocalizations class also provides auto-generated
      // localizationsDelegates and supportedLocales lists. You can use these instead of providing them manually.
      // you can use the following instead of the localizationsDelegates list property:

      // Uncomment below *
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,

      localizationsDelegates: const [
        AppLocalizations
            .delegate, // This line is added after codegen generates the gen_l10n folder.
        GlobalMaterialLocalizations
            .delegate, // Provides localized strings and other values for the Material Components library.
        GlobalWidgetsLocalizations
            .delegate, // Defines the default text direction, either left-to-right or right-to-left, for the widgets library.
        GlobalCupertinoLocalizations
            .delegate, // Provides localized strings and other values for the Cupertino Components library.
      ],
      // SupportedLocales is used to specify the languages and regions that are
      // supported by the app for localisation.
      // The examples below do not include a region, eg. Locale('en', 'US')
      supportedLocales: const [
        Locale('en'), // English
        Locale('es'), // Spanish
        Locale('fr'), // French
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'flutter Internationalisation Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The AppBar title will now update its message according to the target
        // platform. Switching the device's locale between English, Spanish and
        // French locales should cause this text to update.
        title: Text(AppLocalizations.of(context)!.helloWorld),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.hello('Sharon'),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
