part of 'post_list.dart';

class BuildNavigation extends StatelessWidget {
  final PostListModel? entity;

  const BuildNavigation({super.key, this.entity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ListBloc>().add(NavigateToHomeEvent(postModel: entity));
        NavigationService.navigateTo(RoutePaths.homeScreen);
      },
      child: BuildContainer(
        entity: entity ?? PostListModel(),
      ),
    );
  }
}
