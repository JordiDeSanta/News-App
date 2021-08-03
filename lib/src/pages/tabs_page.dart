import 'package:flutter/material.dart';
import 'package:newsapp/src/pages/tab1_page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavigationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.actualPage,
      onTap: (i) => navigationModel.actualPage = i,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'For You'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Headers'),
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: navigationModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      onPageChanged: (p) => navigationModel.actualPage = p,
      children: [
        Tab1Page(),
        Container(color: Colors.brown),
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _actualPage = 0;
  PageController _pageController = new PageController();

  PageController get pageController => _pageController;

  int get actualPage => this._actualPage;
  set actualPage(int value) {
    this._actualPage = value;
    this._pageController.animateToPage(value,
        duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
    notifyListeners();
  }
}
