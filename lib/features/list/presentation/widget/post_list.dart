import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_test/features/list/domain/entity/post_list_entity.dart';
import 'package:tdd_test/features/list/presentation/bloc/list_bloc.dart';
import 'package:tdd_test/res/res_export.dart';

class PostListWidget extends StatelessWidget {
  const PostListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListBloc, ListState>(
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return buildContainer(
              context,
              state.postList?.postList?[index] ??
                  const PostEntity().emptyState(),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
          itemCount: state.postList?.postList?.length ?? 0,
        );
      },
    );
  }

  Column buildColumn(BuildContext context, PostEntity? entity) {
    return Column(
      children: [
        buildRow(
          context: context,
          userId: '${entity?.userId ?? ""}',
          title: entity?.title ?? '',
        ),
        Text(
          entity?.body ?? 'Empty',
          style: TextStyle(fontSize: measurement.textSize(12)),
        ),
      ],
    );
  }

  Row buildRow({required BuildContext context, String? userId, String? title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$userId',
          style: TextStyle(fontSize: measurement.textSize(12)),
        ),
        Text(
          '$title',
          style: TextStyle(fontSize: measurement.textSize(12)),
        ),
      ],
    );
  }

  Container buildContainer(BuildContext context, PostEntity entity) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: measurement.margin(8.0),
        horizontal: measurement.margin(16.0),
      ),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(
          measurement.radius(16),
        ),
      ),
      child: buildColumn(context, entity),
    );
  }
}
