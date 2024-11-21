part of 'post_list.dart';

class BuildContainer extends StatelessWidget {
  final PostListModel entity;
  const BuildContainer({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('list_container'),
      margin: EdgeInsets.symmetric(
        vertical: measurement.margin(8.0),
        horizontal: measurement.margin(16.0),
      ),
      padding: EdgeInsets.symmetric(
        vertical: measurement.padding(8.0),
        horizontal: measurement.padding(16.0),
      ),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(
          measurement.radius(16),
        ),
      ),
      child: BuildColumn(entity: entity),
    );
  }
}
