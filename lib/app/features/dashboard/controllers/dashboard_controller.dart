part of dashboard;

class DashboardController extends GetxController {
  final scafoldKey = GlobalKey<ScaffoldState>();

  final dataProfile = const UserProfileData(
    image: AssetImage(ImageRasterPath.man),
    name: "Mark",
    jobDescription: "Software Engineer",
  );

  final member = ["Paul Doe", "Michael Jordan"];

  final dataTask = const TaskProgressData(totalTask: 5, totalCompleted: 2);

  final taskInProgress = [
    CardTaskData(
      label: "Determine meeting schedule",
      jobDescription: "System Analyst",
      dueDate: DateTime.now().add(const Duration(minutes: 50)),
    ),
    CardTaskData(
      label: "Personal portfolio",
      jobDescription: "Marketing",
      dueDate: DateTime.now().add(const Duration(hours: 4)),
    ),
    CardTaskData(
      label: "UI UX",
      jobDescription: "Design",
      dueDate: DateTime.now().add(const Duration(days: 2)),
    ),
    CardTaskData(
      label: "Search new options to developer",
      jobDescription: "System Analyst",
      dueDate: DateTime.now().add(const Duration(minutes: 50)),
    )
  ];

  void onPressedProfile() {}

  void onSelectedMainMenu(int index, SelectionButtonData value) {
    // ignore: avoid_print
    print(value.label);
  }

  void onSelectedTaskMenu(int index, String label) {
    // ignore: avoid_print
    print(label);
  }

  void onSelectedTask(String value) {
    // ignore: avoid_print
    print(value);
  }
}
