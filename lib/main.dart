import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:memento_mori/generated/l10n.dart';
import 'package:memento_mori/screens/entry_screen.dart';
import 'package:memento_mori/screens/memento_screen.dart';
import 'package:memento_mori/screens/shared_pref_gate.dart';
import 'package:memento_mori/utils/constants.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: black,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizationDelegate(),
      ],
      supportedLocales: S.delegate.supportedLocales,
      initialRoute: "/",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/home":
            return MaterialPageRoute(
              builder: (context) => const MementoScreen(),
            );
          case "/entry":
            return MaterialPageRoute(
              builder: (context) => const EntryData(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => const SharedPrefGate(),
            );
        }
      },
    );
  }
}
