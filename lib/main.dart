import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/src/pages/tabs_page.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/theme/theme.dart' as themes;
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: ThemeData.dark().scaffoldBackgroundColor,
        systemNavigationBarDividerColor:
            ThemeData.dark().scaffoldBackgroundColor,
      ),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News',
        initialRoute: 'tabs',
        routes: {
          'tabs': (c) => TabsPage(),
        },
        theme: themes.dark,
      ),
    );
  }
}
