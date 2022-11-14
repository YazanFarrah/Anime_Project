import 'package:fbanime/screens/screens.dart';
import 'package:fbanime/screens/sign_up_options.dart';
import 'package:fbanime/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './theme/theme.dart';
import 'config/palette.dart';
import 'providers/auth.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          routes: {'login': (context) => MyLogin()},
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          // darkTheme: AppTheme.dark(),
          // themeMode: ThemeMode.dark,
          home: auth.isAuth ? NavScreen() : MyLogin(),
        ),
      ),
    );
  }
}
