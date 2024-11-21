part of 'post_list.dart';

class BuildRow extends StatelessWidget {
  final String userId;
  final String title;
  const BuildRow({
    super.key,
    required this.userId,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      key: const Key('list_row'),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            '$userId',
            style: TextStyle(fontSize: measurement.textSize(12)),
          ),
        ),
        Expanded(
          child: Text(
            '$title',
            style: TextStyle(fontSize: measurement.textSize(12)),
          ),
        ),
      ],
    );
  }
}
