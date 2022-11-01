part of dashboard;

class _Member extends StatelessWidget {
  final List<String> member;
  final int maxDisplayPeople = 2;

  const _Member({
    super.key,
    required this.member,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        (member.length > maxDisplayPeople) ? maxDisplayPeople : member.length,
        (index) => SimpleUserProfile(
          name: member[index],
          onPressed: () {},
        ),
      ),
    );
  }
}
