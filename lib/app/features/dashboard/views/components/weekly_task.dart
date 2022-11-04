part of dashboard;

class _WeeklyTask extends StatelessWidget {
  final List<ListTaskAssignedData> data;
  final Function(int index, ListTaskAssignedData data) onPressed;
  final Function(int index, ListTaskAssignedData data) onPressedAssign;
  final Function(int index, ListTaskAssignedData data) onPressedMember;

  const _WeeklyTask({
    required this.data,
    required this.onPressed,
    required this.onPressedAssign,
    required this.onPressedMember,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: data
          .asMap()
          .entries
          .map(
            (e) => ListTaskAssigned(
              data: e.value,
              onPressed: () => onPressed(e.key, e.value),
              onPressedAssign: () => onPressedAssign(e.key, e.value),
              onPressedMember: () => onPressedMember(e.key, e.value),
            ),
          )
          .toList(),
    );
  }
}
