import 'package:dailytask/app/config/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TaskProgressData {
  final int totalTask;
  final int totalCompleted;

  const TaskProgressData({
    required this.totalTask,
    required this.totalCompleted,
  });
}

class TaskProgress extends StatelessWidget {
  final TaskProgressData data;

  const TaskProgress({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildText(),
        Expanded(
          child: _buildProgress(),
        )
      ],
    );
  }

  Widget _buildText() {
    return Text(
      "${data.totalCompleted} of ${data.totalTask} completed",
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        color: FontColorPallets.lightGrey,
        fontSize: 13,
      ),
    );
  }

  Widget _buildProgress() {
    return LinearPercentIndicator(
      percent: data.totalCompleted / data.totalTask,
      progressColor: Colors.blueGrey,
      backgroundColor: Colors.blueGrey[200],
    );
  }
}
