import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_test/features/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:tdd_test/features/homepage/presentation/widget/item_list.dart';

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
    return AppBar(
      centerTitle: true,
      title: const Text('Home Screen'),
    );
  }

  Container _pageBody() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.cyanAccent,
      ),
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      child: const ItemList(),
    );
  }

  ElevatedButton navigateToButton(BuildContext context) {
    return ElevatedButton(
      key: const Key('navigate_auth_key'),
      onPressed: () {
        context.read<HomepageBloc>().add(NavigateEvent());
      },
      child: const Text('Jump To Authentication'),
    );
  }
}
