// ignore_for_file: avoid_print

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

  final weeklyTask = [
    ListTaskAssignedData(
      icon: const Icon(EvaIcons.monitor, color: Colors.blueGrey),
      label: "Slicing UI",
      jobDescription: "Programmer",
      assignTo: "Alex Kid",
      editDate: DateTime.now().add(-const Duration(hours: 2)),
    ),
    ListTaskAssignedData(
      icon: const Icon(EvaIcons.star, color: Colors.amber),
      label: "Personal branding",
      jobDescription: "Marketing",
      assignTo: "Nathan Drake",
      editDate: DateTime.now().add(-const Duration(days: 50)),
    ),
    const ListTaskAssignedData(
      icon: Icon(EvaIcons.colorPalette, color: Colors.blue),
      label: "UI UX ",
      jobDescription: "Design",
    ),
    const ListTaskAssignedData(
      icon: Icon(EvaIcons.pieChart, color: Colors.redAccent),
      label: "Determine meeting schedule ",
      jobDescription: "System Analyst",
    ),
  ];

  void onPressedProfile() {}

  void onSelectedMainMenu(int index, SelectionButtonData value) {
    print(value.label);
  }

  void onSelectedTaskMenu(int index, String label) {
    print(label);
  }

  void onSelectedTask(String value) {
    print(value);
  }

  void onPressedTask(int index, ListTaskAssignedData data) {
    print(data);
  }

  void onPressedAssignTask(int index, ListTaskAssignedData data) {
    print(data);
  }

  void onPressedMemberTask(int index, ListTaskAssignedData data) {
    print(data);
  }
}
