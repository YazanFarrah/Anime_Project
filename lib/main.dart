import 'package:fbanime/screens/screens.dart';

import 'package:fbanime/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth.dart';

//ss
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
            theme: AppTheme.dark(),
            // darkTheme: AppTheme.dark(),
            // themeMode: ThemeMode.dark,
            home:
                //  auth.isAuth ?
                NavScreen()
            //  : MyLogin(),
            ),
      ),
    );
  }
}
