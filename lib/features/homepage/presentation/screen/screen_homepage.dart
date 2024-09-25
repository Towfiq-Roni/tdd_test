import 'package:flutter/material.dart';

class ScreenHomepage extends StatelessWidget {
  const ScreenHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _pageBody(),
    );
  }

  AppBar _appBar() {
    return AppBar();
  }

  Container _pageBody() {
    return Container();
  }
}
