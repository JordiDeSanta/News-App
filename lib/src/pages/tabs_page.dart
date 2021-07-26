import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

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

    return Scaffold(
        body: PageView(
      physics: BouncingScrollPhysics(),
      children: [
        Container(color: Colors.blue),
        Container(color: Colors.brown),
      ],
    ));
  }
}
