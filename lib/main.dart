import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:milk_calculator/screen/loading_screen.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  UnityAds.init(gameId: '4462087');
  runApp(
    const MaterialWidget(),
  );
}

class MaterialWidget extends StatelessWidget {
  const MaterialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: Colors.amber,
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.amber,
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.amber,
          onPrimary: Color(0xffFF4C4C),
          secondary: Color(0xffF3FEB8),
          onSecondary: Color(0xffFF4C4C),
          error: Color(0xffFF4C4C),
          onError: Color(0xffF3FEB8),
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        highlightColor: const Color(0xffF3FEB8),
        useMaterial3: true,
      ),
      dark: ThemeData(
          primarySwatch: Colors.amber,
          primaryColor: Colors.amber,
          brightness: Brightness.dark,
          colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: Colors.amber,
              onPrimary: Colors.white,
              secondary: Colors.grey,
              onSecondary: Colors.black,
              error: Colors.red,
              onError: Colors.white,
              surface: Color(0xff121212),
              onSurface: Colors.grey),
          useMaterial3: true),
      builder: (theme, darkTheme) {
        return MaterialApp(
          theme: theme,
          darkTheme: darkTheme,
          home: const LoadingScreen(isFirstTime: true,),
        );
      },
      initial: AdaptiveThemeMode.system,
    );
  }
}
