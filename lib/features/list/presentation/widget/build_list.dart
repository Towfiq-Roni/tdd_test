part of 'post_list.dart';

class BuildList extends StatelessWidget {
  final List<PostListModel>? postList;
  const BuildList({super.key, this.postList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      key: const Key('post_list'),
      itemBuilder: (BuildContext listContext, int index) {
        return BuildNavigation(
          entity: postList?[index] ?? PostListModel(),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemCount: postList?.length ?? 0,
    );
  }
}
