import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_test/features/list/presentation/bloc/list_bloc.dart';
import 'package:tdd_test/features/list/presentation/widget/post_list.dart';

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
      body: const PostListWidget(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('List Items'),
    );
  }
}
