import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flag/flag.dart';
import 'package:intl/intl.dart';

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
  late String deviceLocale = 'EN';

  @override
  void initState() {
    super.initState();
    deviceLocale = getDeviceLocale();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // TODO: How to pass in the localized string into the application title
      // onGenerateTitle: (context) => DemoLocalizations.of(context).title,
      debugShowCheckedModeBanner: false,
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
      home: MyHomePage(
          title: 'flutter Internationalisation Demo',
          deviceLocale: deviceLocale),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key, required this.title, required this.deviceLocale});

  final String title;
  final String deviceLocale;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Display the currency amount
    const double amount = 123.00;
    var currencyFormat = NumberFormat.currency(
      locale: widget.deviceLocale,
      decimalDigits: 2,
    );
    var formattedAmount = currencyFormat.format(amount);

    return Scaffold(
      appBar: AppBar(
        // The AppBar title, centered Text and Flag will now update its message according to the target
        // platform. Switching the device's locale between English, Spanish and
        // French locales should cause this text to update.
        title: Text(AppLocalizations.of(context)!.helloWorld),
        backgroundColor: widget.deviceLocale == 'en'
            ? Colors.red
            : widget.deviceLocale == 'fr'
                ? Colors.blue.shade900
                : Colors.red.shade900,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  AppLocalizations.of(context)!.hello('Sharon'),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Center(child: Flag.fromString(widget.deviceLocale)),
              Text(
                formattedAmount,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
