part of dashboard;

class _HeaderWeeklyTask extends StatelessWidget {
  const _HeaderWeeklyTask();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const HeaderText('Weekly Task'),
        const Spacer(),
        _buildAddArchive(),
        const SizedBox(
          width: 10,
        ),
        _buildAddButton(),
      ],
    );
  }

  Widget _buildAddButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
      ),
      icon: const Icon(
        EvaIcons.plus,
        size: 16,
      ),
      label: const Text('New'),
    );
  }

  Widget _buildAddArchive() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.grey[850],
        backgroundColor: Colors.grey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
      ),
      child: const Text('Archive'),
    );
  }
}
