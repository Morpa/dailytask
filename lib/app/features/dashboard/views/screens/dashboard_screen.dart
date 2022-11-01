library dashboard;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:dailytask/app/config/constants/app_constants.dart';
import 'package:dailytask/app/shared_components/user_profile.dart';
import 'package:dailytask/app/shared_components/selection_button.dart';
import 'package:dailytask/app/shared_components/simple_selection_button.dart';
import 'package:dailytask/app/shared_components/simple_user_profile.dart';

// binding
part '../../bindings/dashboard_binding.dart';

// controller
part '../../controllers/dashboard_controller.dart';

// components
part '../components/main_menu.dart';
part '../components/member.dart';
part '../components/task_menu.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Flexible(
          flex: 3,
          child: SingleChildScrollView(
            child: _buildSidebar(context),
          ),
        ),
        Flexible(
          flex: 10,
          child: SingleChildScrollView(
            child: _buildTaskContent(context),
          ),
        ),
        Flexible(
          flex: 4,
          child: SingleChildScrollView(
            child: _buildCalendarContent(context),
          ),
        ),
      ],
    ));
  }

  Widget _buildSidebar(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: UserProfile(
            data: controller.dataProfile,
            onPressed: controller.onPressedProfile,
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: _MainMenu(
            onSelected: controller.onSelectedMainMenu,
          ),
        ),
        const Divider(
          indent: 20,
          thickness: 1,
          endIndent: 20,
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: _Member(member: controller.member),
        ),
        const SizedBox(
          height: sSpacing,
        ),
        _TaskMenu(onSelected: controller.onSelectedTaskMenu),
        const SizedBox(
          height: sSpacing,
        ),
        Padding(
          padding: const EdgeInsets.all(sSpacing),
          child: Text(
            "2022 Learn works",
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ],
    );
  }

  Widget _buildTaskContent(BuildContext context) {
    return Container();
  }

  Widget _buildCalendarContent(BuildContext context) {
    return Container();
  }
}
