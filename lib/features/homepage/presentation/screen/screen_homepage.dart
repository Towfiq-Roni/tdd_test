import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_test/features/list/data/model/post_list_model.dart';
import 'package:tdd_test/features/list/presentation/bloc/list_bloc.dart';
import 'package:tdd_test/res/res_export.dart';

class ScreenHomepage extends StatefulWidget {
  const ScreenHomepage({super.key});

  @override
  State<ScreenHomepage> createState() => _ScreenHomepageState();
}

class _ScreenHomepageState extends State<ScreenHomepage> {
  late PostListModel post;

  @override
  void initState() {
    super.initState();
    post = context.read<ListBloc>().state.postModel ?? PostListModel.empty();
  }

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
      key: const Key('post_item'),
      margin: EdgeInsets.symmetric(
        vertical: measurement.margin(12),
        horizontal: measurement.margin(16),
      ),
      child: Column(
        children: [
          buildText(itemName: 'User ID: ', textItem: post.userId),
          buildText(itemName: 'Post ID: ', textItem: post.id),
          buildText(itemName: 'Post Title: ', textItem: post.title),
          buildText(itemName: 'Post Body: ', textItem: post.body),
        ],
      ),
    );
  }

  Row buildText({String? itemName, dynamic textItem}) {
    return Row(
      children: [
        Expanded(child: Text('$itemName')),
        SizedBox(width: measurement.sizeByWidth(16)),
        Expanded(child: Text('$textItem')),
      ],
    );
  }
}
