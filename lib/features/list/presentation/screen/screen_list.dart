import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_test/features/list/presentation/bloc/list_bloc.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ListBloc>().add(GetListEvent());
  }

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
