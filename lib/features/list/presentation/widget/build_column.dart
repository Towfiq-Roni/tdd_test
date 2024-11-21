part of 'post_list.dart';

class BuildColumn extends StatelessWidget {
  final PostListModel? entity;
  const BuildColumn({super.key, this.entity});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key('list_column'),
      children: [
        BuildRow(
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
}
