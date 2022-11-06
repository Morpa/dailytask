import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dailytask/app/config/constants/app_constants.dart';

class ListTaskDateData {
  final DateTime date;
  final String label;
  final String jobDescription;

  const ListTaskDateData({
    required this.date,
    required this.label,
    required this.jobDescription,
  });
}

class ListTaskDate extends StatelessWidget {
  final ListTaskDateData data;
  final Function() onPressed;
  final Color? dividerColor;

  const ListTaskDate({
    super.key,
    required this.data,
    required this.onPressed,
    this.dividerColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(sBorderRadius),
      child: Padding(
        padding: const EdgeInsets.all(sSpacing / 2),
        child: Row(
          children: [
            _buildHours(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: sSpacing / 2),
              child: _buildDivider(),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(),
                _buildSubtitle(),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildHours() {
    return Text(
      DateFormat.Hm().format(data.date),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 3,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        gradient: LinearGradient(
          colors: [
            dividerColor ?? Colors.amber,
            dividerColor?.withOpacity(.6) ?? Colors.amber.withOpacity(.6),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      data.jobDescription,
      maxLines: 1,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w200,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle() {
    return Text(
      data.label,
      maxLines: 1,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
