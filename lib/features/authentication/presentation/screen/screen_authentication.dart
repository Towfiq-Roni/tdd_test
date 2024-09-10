import 'package:flutter/material.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

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
    return Container(
      decoration: const ShapeDecoration(
        color: Colors.lightBlue,
        shape: Border.symmetric(
          vertical: BorderSide(color: Colors.redAccent),
          horizontal: BorderSide(color: Colors.cyanAccent),
        ),
      ),
      child: const Center(
        child: Text('AuthenticationScreen'),
      ),
    );
  }
}
