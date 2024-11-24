import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_test/features/list/data/model/post_list_model.dart';
import 'package:tdd_test/features/list/presentation/bloc/list_bloc.dart';
import 'package:tdd_test/res/res_export.dart';
import 'package:tdd_test/services/navigation/navigation_service.dart';

part 'build_column.dart';
part 'build_container.dart';
part 'build_list.dart';
part 'build_navigation.dart';
part 'build_row.dart';

class PostListWidget extends StatelessWidget {
  const PostListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListBloc, ListState>(
      builder: (blocContext, state) {
        return BuildList(
          postList: state.postList,
        );
      },
    );
  }

  // Column buildColumn({required BuildContext context, PostListModel? entity}) {
  //   return Column(
  //     key: const Key('list_column'),
  //     children: [
  //       buildRow(
  //         context: context,
  //         userId: '${entity?.userId ?? ""}',
  //         title: entity?.title ?? '',
  //       ),
  //       Text(
  //         entity?.body ?? 'Empty',
  //         style: TextStyle(fontSize: measurement.textSize(12)),
  //       ),
  //     ],
  //   );
  // }

  // Row buildRow({required BuildContext context, String? userId, String? title}) {
  //   return Row(
  //     key: const Key('list_row'),
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Expanded(
  //         child: Text(
  //           '$userId',
  //           style: TextStyle(fontSize: measurement.textSize(12)),
  //         ),
  //       ),
  //       Expanded(
  //         child: Text(
  //           '$title',
  //           style: TextStyle(fontSize: measurement.textSize(12)),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Container buildContainer(
  //     {required BuildContext context, PostListModel? entity}) {
  //   return Container(
  //     key: const Key('list_container'),
  //     margin: EdgeInsets.symmetric(
  //       vertical: measurement.margin(8.0),
  //       horizontal: measurement.margin(16.0),
  //     ),
  //     padding: EdgeInsets.symmetric(
  //       vertical: measurement.padding(8.0),
  //       horizontal: measurement.padding(16.0),
  //     ),
  //     decoration: BoxDecoration(
  //       color: Colors.black12,
  //       borderRadius: BorderRadius.circular(
  //         measurement.radius(16),
  //       ),
  //     ),
  //     child: buildColumn(context: context, entity: entity),
  //   );
  // }
}
