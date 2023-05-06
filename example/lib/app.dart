import 'package:bimatarung_design_system/bimatarung_design_system.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => BTComponentInit(
        builder: () => MaterialApp(
          title: 'Bimatarung Design System',
          theme: BTTHeme.main().copyWith(extensions: <ThemeExtension<dynamic>>[
            BTThemeColor.light,
          ]),
          darkTheme: BTTHeme.main().copyWith(
            extensions: <ThemeExtension<dynamic>>[
              BTThemeColor.dark,
            ],
          ),
          home: const HomePage(),
        ),
      );
}
