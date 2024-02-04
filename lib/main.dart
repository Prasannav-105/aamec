import 'package:aamec/pages/helper/automatic_page_scroll_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AutomaticPageScrollProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
            scrollbarTheme: const ScrollbarThemeData(
                thumbColor: MaterialStatePropertyAll(
                  Colors.black,
                ),
                thickness: MaterialStatePropertyAll(5))),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
