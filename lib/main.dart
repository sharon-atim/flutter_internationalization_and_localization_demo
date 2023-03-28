import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flag/flag.dart';
import 'app_localizations_context.dart';

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
  late String deviceLocale;

  @override
  void initState() {
    super.initState();
    deviceLocale = getDeviceLocale();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter Internationalisation Demo',
      // LocalizationsDelegates defines a list of delegates that Flutter will
      // use to look up localised strings and other resources for the app.

      localizationsDelegates: AppLocalizations.localizationsDelegates,

      // SupportedLocales is used to specify the languages and regions that are
      // supported by the app for localisation.
      // The examples below do not include a region, eg. Locale('en', 'US')
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) => context.loc.helloWorld,

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
    return Scaffold(
      appBar: AppBar(
        // The AppBar title, centered Text and Flag will now update its message according to the target
        // platform. Switching the device's locale between English, Spanish and
        // French locales should cause this text to update.
        title: Text(context.loc.helloWorld),
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
                  context.loc.hello('Sharon'),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Center(child: Flag.fromString(widget.deviceLocale)),
            ],
          ),
        ),
      ),
    );
  }
}
