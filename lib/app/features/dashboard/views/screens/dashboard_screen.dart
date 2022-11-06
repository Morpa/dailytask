library dashboard;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:dailytask/app/utils/helpers/app_helpers.dart';
import 'package:dailytask/app/config/constants/app_constants.dart';
import 'package:dailytask/app/shared_components/user_profile.dart';
import 'package:dailytask/app/shared_components/selection_button.dart';
import 'package:dailytask/app/shared_components/simple_selection_button.dart';
import 'package:dailytask/app/shared_components/simple_user_profile.dart';
import 'package:dailytask/app/shared_components/search_field.dart';
import 'package:dailytask/app/shared_components/header_text.dart';
import 'package:dailytask/app/shared_components/card_task.dart';
import 'package:dailytask/app/shared_components/list_task_assigned.dart';
import 'package:dailytask/app/shared_components/list_task_date.dart';
import 'package:dailytask/app/shared_components/task_progress.dart';
import 'package:intl/intl.dart';

// binding
part '../../bindings/dashboard_binding.dart';

// controller
part '../../controllers/dashboard_controller.dart';

// components
part '../components/main_menu.dart';
part '../components/member.dart';
part '../components/task_menu.dart';
part '../components/task_in_progress.dart';
part '../components/header_weekly_task.dart';
part '../components/weekly_task.dart';
part '../components/task_group.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: const VerticalDivider(),
          ),
          Flexible(
            flex: 4,
            child: SingleChildScrollView(child: _buildCalendarContent(context)),
          ),
        ],
      ),
    );
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sSpacing),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: sSpacing),
          SearchField(
            hintText: 'Search Task',
            onSearch: controller.onSelectedTask,
          ),
          const SizedBox(height: sSpacing),
          Row(
            children: [
              HeaderText(DateTime.now().formatdMMMMY()),
              const Spacer(),
              SizedBox(
                width: 200,
                child: TaskProgress(data: controller.dataTask),
              ),
            ],
          ),
          const SizedBox(height: sSpacing),
          _TaskInProgress(data: controller.taskInProgress),
          const SizedBox(height: sSpacing),
          const _HeaderWeeklyTask(),
          const SizedBox(height: sSpacing),
          _WeeklyTask(
            data: controller.weeklyTask,
            onPressed: controller.onPressedTask,
            onPressedAssign: controller.onPressedAssignTask,
            onPressedMember: controller.onPressedMemberTask,
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: sSpacing),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: sSpacing,
          ),
          Row(
            children: [
              const Expanded(
                child: HeaderText('Calendar'),
              ),
              IconButton(
                onPressed: controller.onPressedCalendar,
                icon: const Icon(EvaIcons.calendarOutline),
                tooltip: 'calendar',
              ),
            ],
          ),
          ...controller.taskGroup
              .map(
                (e) => _TaskGroup(
                  title: DateFormat('d MMMM').format(e[0].date),
                  data: e,
                  onPressed: controller.onPressedTaskGroup,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
