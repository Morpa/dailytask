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

  final taskGroup = [
    [
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 2, hours: 10)),
        label: "5 posts on instagram",
        jobDescription: "Marketing",
      ),
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 2, hours: 11)),
        label: "Platform Concept",
        jobDescription: "Animation",
      ),
    ],
    [
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 4, hours: 5)),
        label: "UI UX Marketplace",
        jobDescription: "Design",
      ),
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 4, hours: 6)),
        label: "Create Post For App",
        jobDescription: "Marketing",
      ),
    ],
    [
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 6, hours: 5)),
        label: "2 Posts on Facebook",
        jobDescription: "Marketing",
      ),
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 6, hours: 6)),
        label: "Create Icon App",
        jobDescription: "Design",
      ),
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 6, hours: 8)),
        label: "Fixing Error Payment",
        jobDescription: "Programmer",
      ),
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 6, hours: 10)),
        label: "Create Form Interview",
        jobDescription: "System Analyst",
      ),
    ]
  ];

  void onPressedProfile() {}

  void searchTask(String value) {
    print(value);
  }

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

  void onPressedCalendar() {}

  void onPressedTaskGroup(int index, ListTaskDateData data) {
    print(data);
  }

  void openDrawer() {
    if (scafoldKey.currentState != null) {
      scafoldKey.currentState!.openDrawer();
    }
  }
}
