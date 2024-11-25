part of 'post_list.dart';

class BuildNavigation extends StatelessWidget {
  final PostListModel? entity;

  const BuildNavigation({super.key, this.entity});

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return GestureDetector(
      key: Key('navigate_to_home[${entity?.id ?? 0}]'),
      onTap: () {
        context.read<ListBloc>().add(NavigateToHomeEvent(postModel: entity));
        NavigationService.navigateTo(RoutePaths.homeScreen);
        IncreaseTap(initialTap: i);
      },
      child: BuildContainer(
        entity: entity ?? PostListModel(),
      ),
    );
  }
}

class IncreaseTap {
  late int _tapped;
  final int? initialTap;

  int get tap {
    return _tapped + 1;
  }

  IncreaseTap({this.initialTap}) {
    if (initialTap == null) _tapped = 0;
    _tapped = initialTap ?? 0;
  }
}
