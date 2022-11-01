part of dashboard;

class DashboardController extends GetxController {
  final scafoldKey = GlobalKey<ScaffoldState>();

  final dataProfile = const UserProfileData(
    image: AssetImage(ImageRasterPath.man),
    name: "Mark",
    jobDescription: "Software Engineer",
  );

  final member = ["Paul Doe", "Michael Jordan"];

  void onPressedProfile() {}

  void onSelectedMainMenu(int index, SelectionButtonData value) {
    // ignore: avoid_print
    print(value.label);
  }

  void onSelectedTaskMenu(int index, String label) {
    // ignore: avoid_print
    print(label);
  }
}
