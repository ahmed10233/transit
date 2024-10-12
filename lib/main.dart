import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_one/cubits/get_data_cubit.dart';
import 'package:task_one/views/HomeView.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'cubits/lang_cubit.dart';

late SharedPreferences sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  // Get the saved language or default to English if not set
  String? savedLanguage = sharedPref.getString('Language');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LangCubit(),
        ),
        BlocProvider(
          create: (context) => GetDataCubit(),
        ),
        // Add other BlocProviders here
      ],
      child: MyApp(
        savedLanguage: savedLanguage,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String? savedLanguage;

  const MyApp({super.key, this.savedLanguage});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LangCubit, LangState>(
      builder: (context, state) {
        Locale locale;
        if (state is LangAR) {
          locale = Locale('ar');
        } else {
          locale = Locale('en'); // here is default lang
        }
        return MaterialApp(
          locale: locale,
          // Localizations setup
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'), // English locale
            Locale('ar'), // Arabic locale
          ],
          debugShowCheckedModeBanner: false,
          home: HomeView(),
        );
      },
    );
  }
}
